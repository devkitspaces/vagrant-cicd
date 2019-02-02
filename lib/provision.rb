def run_provisioners(config, provisioners)
  provisioners & .each do |file |
    config.vm.provision: shell do |sh |
      sh.path = file
    end
  end
end

def get_provisioners(root_dir)
  provision_dir = 'provision'
  provision_path = "#{root_dir}/#{provision_dir}"
  provision_files = Dir.glob("#{provision_path}/*.sh")
  return provision_files
end