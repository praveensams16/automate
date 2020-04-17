describe file('/etc/yum.conf') do  # Searching a file
  its('content') { should match /gpgcheck=1/ }  # Using the "Content" matcher

end

describe command('rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey') do  # Running a command 
   its('stdout') { should match (/[0-9]/) }   # Matching its standard output
end
describe command('cat /etc/passwd') do  # Running a command 
   its('stdout') { should match (/ba.h/) }   # Matching its standard output
end

if ( 4 > 3 ) 
    puts "saaam"
end


['httpd','httpd-tools'].each do |a|

describe package(a) do
  it { should be_installed }
  end
 end
