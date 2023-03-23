using System.Security.Claims;
using System.Text.Json;
using System.Xml.Linq;

using ChatApp.Models;

using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

using static System.Net.Mime.MediaTypeNames;

namespace ChatApp.Pages {
    public class IndexModel : PageModel {
        private readonly ILogger<IndexModel> _logger;
        ChatAppContext db = new ChatAppContext();

        public IndexModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {

        }

        public void OnPostAddUser(string username, string password, IFormFile image)
        {
            User u = db.Users.FirstOrDefault(x => x.UserName == username);
            if (u == null)
            {
                try
                {
                    string fileName = "user.png";
                    if(image != null)
                    {
                        fileName = Path.GetFileName(image.FileName);
                        string filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "Image", username);
                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            image.CopyTo(stream);
                        }
                    }
                    User user = new User()
                    {
                        UserName = username,
                        PassWord = password,
                        IsOnline = false,
                        Img = $"./Image/{fileName}"
                    };
                    db.Users.Add(user);
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                   
                }
            }
        }


        public async Task<IActionResult> OnPostLogin(string username, string password)
        {
            User u = db.Users.FirstOrDefault(x => x.UserName == username && x.PassWord == password);
            if(u != null)
            {

                var claims = new List<Claim>
                {
                    new Claim("User", JsonSerializer.Serialize(u)),
                };
                var identity = new ClaimsIdentity(claims, "User");
                var principal = new ClaimsPrincipal(identity);
                await HttpContext.SignInAsync(principal, new AuthenticationProperties
                {
                    ExpiresUtc = DateTime.UtcNow.AddDays(7)
                });
                u.IsOnline = true;
                db.SaveChanges();
                return Redirect("./Chat");
            }
            return Page();
        }
    }
}