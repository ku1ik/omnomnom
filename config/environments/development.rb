puts "Configuring development environment..."

use Rack::LessCss, :less_path => File.join(APP_ROOT, "public", "stylesheets")
