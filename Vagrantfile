require 'json'
require 'yaml'

VAGRANTFILE_API_VERSION = "2"
confDir = $confDir ||= File.expand_path("~/.homestead-plus")

homesteadYamlPath = confDir + "/HomesteadPlus.yaml"
afterScriptPath = confDir + "/after.sh"
aliasesPath = confDir + "/aliases"
customProvisionPath = File.expand_path("./scripts/custom-provision.sh")
customImportPath = File.expand_path("./scripts/import-sql.sh")

require File.expand_path(File.dirname(__FILE__) + '/scripts/homestead-plus.rb')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	if File.exists? aliasesPath then
		config.vm.provision "file", source: aliasesPath, destination: "~/.bash_aliases"
	end

	HomesteadPlus.configure(config, YAML::load(File.read(homesteadYamlPath)))

	# Run custom provisioning before after.sh
    if File.exists? customProvisionPath then
        config.vm.provision "shell", path: customProvisionPath
    end

    # Run custom import before after.sh
    if File.exists? customImportPath then
        config.vm.provision "shell", path: customImportPath
    end

	if File.exists? afterScriptPath then
		config.vm.provision "shell", path: afterScriptPath
	end
end
