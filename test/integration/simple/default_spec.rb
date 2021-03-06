describe package('rsync') do
  it { should be_installed }
end

describe command('ps aux | grep rsync') do
  its('exit_status') { should eq 0 }
end

# rsync is serving /tmp
describe command('rsync rsync://127.0.0.1') do
  its('stdout') { should match /tmp/ }
  its('exit_status') { should eq 0 }
end
