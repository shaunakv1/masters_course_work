namespace 'rcov' do
  begin
    require 'rcov/rcovtask'
    Rcov::RcovTask.new do |t|
      t.name = 'test'
      t.libs << "test"
      t.test_files = FileList['test/**/*test.rb']   
      t.verbose = true
      t.rcov_opts = ['-x', '^lib,^config/boot']     
    end
  rescue LoadError                                  
    # ignore missing rcov
  end
end