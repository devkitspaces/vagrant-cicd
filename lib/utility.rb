def enable_shares(config, nfs)
  config.vm.synced_folder ".", "/vagrant", type: "rsync",
                                            rsync__exclude: ['gitlab', 'postgresql', 'gitlab-shell', 'gitlab-runner'],
                                            rsync__auto: false
  config.vm.synced_folder "gitlab/", "/vagrant/gitlab", create: true, nfs: nfs
  config.vm.synced_folder "go-gitlab-shell/", "/vagrant/go-gitlab-shell", create: true, nfs: nfs
  config.vm.synced_folder "gitlab-runner/", "/vagrant/gitlab-runner", create: true, nfs: nfs
end

def running_in_admin_mode?
  return false unless Vagrant::Util::Platform.windows?

  (`reg query HKU\\S-1-5-19 2>&1` =~ /ERROR/).nil?
end