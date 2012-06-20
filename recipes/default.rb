include_recipe "libgeoip"
include_recipe "libgssapi-krb5"
include_recipe "libisc"
include_recipe "libssl"

packages = Array.new

case node[:lsb][:codename]
when "lucid"
  include_recipe "libcap"
  include_recipe "libxml2"

  packages |= %w/
    libdns64
  /
when "precise"
  packages |= %w/
    libdns81
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
