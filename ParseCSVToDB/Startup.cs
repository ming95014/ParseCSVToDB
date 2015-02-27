using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ParseCSVToDB.Startup))]
namespace ParseCSVToDB
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
