using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CUED_IN_website3.Startup))]
namespace CUED_IN_website3
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
