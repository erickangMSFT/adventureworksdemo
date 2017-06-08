using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(NewAdventureWorks.Startup))]
namespace NewAdventureWorks
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
