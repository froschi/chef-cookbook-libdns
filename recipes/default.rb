packages = Array.new

case node[:lsb][:codename]
when "lucid"
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
