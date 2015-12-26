require "bundler/setup"
require "chef"
require "chef/knife"

def raw_bag_item(args)
  bag, item = args.values_at(:bag, :item)
  path      = "./test/integration/data_bags/#{bag}/#{item}.json"
  hash      = JSON.parse(File.read(path))

  Chef::DataBagItem.from_hash(hash)
end

def load_secret
  Chef::EncryptedDataBagItem.load_secret("./test/integration/encrypted_data_bag_secret")
end

desc "encrypts a data bag item for integration tests"
task :encrypt, [:bag, :item] do |_, args|
  data_bag_item  = raw_bag_item(args)
  encrypted_item = Chef::EncryptedDataBagItem.encrypt_data_bag_item(data_bag_item, load_secret)
  puts JSON.pretty_generate(encrypted_item.to_hash)
end

desc "decrypts a data bag item for integration tests"
task :decrypt, [:bag, :item] do |_, args|
  data_bag_item  = raw_bag_item(args)
  decrypted_item = Chef::EncryptedDataBagItem.new(data_bag_item, load_secret)
  puts JSON.pretty_generate(decrypted_item.to_hash)
end
