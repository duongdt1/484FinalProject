using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CuedInWebsite.Startup))]
namespace CuedInWebsite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
