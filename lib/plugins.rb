def get_plugins(vagrant)
  required_plugins = %w[vagrant-share]
  required_plugins_non_windows = %w[facter]
  required_plugins_windows = %w[]

  if Vagrant::Util::Platform.windows?
    required_plugins.concat required_plugins_windows
  else
    required_plugins.concat required_plugins_non_windows
  end
  return required_plugins
end

def enable_plugins(plugins)
  plugins.each do |plugin|
    need_restart = false
    unless Vagrant.has_plugin? plugin
      system "[plugins] vagrant plugin install #{plugin}"
      need_restart = true
    end
    exec "vagrant #{ARGV.join(' ')}" if need_restart
  end
end

