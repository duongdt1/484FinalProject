using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(_484FinalProject.Startup))]
namespace _484FinalProject
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
