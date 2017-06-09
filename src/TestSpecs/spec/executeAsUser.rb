describe 'Run As User Test' do
  # Test for getting direct manager hierachy and employee detail.
  it 'Run As PublicApps user' do
    
    # Seed orgchart procs unittest mock data
    seed_orgchart_data()
  
    # column value matching in result sets
     sql.adventureworks.select_humanresources_vemployee(:user => 'PublicApps') do |results|
	 	expect(results[0][:EmailAddress]).to be == 'kXXX@XXXX.com' 
		#demo sample values
		#ken0@adventure-works.com
		#kXXX@XXXX.com
	 end
  end

  it 'Run As InternalApps user' do
    
    # Seed orgchart procs unittest mock data
    seed_orgchart_data()
  
    # column value matching in result sets
     sql.adventureworks.select_humanresources_vemployee(:user => 'InternalApps') do |results|
	 	expect(results[0][:EmailAddress]).to be == 'ken0@adventure-works.com' 
		#demo sample values
		#ken0@adventure-works.com
		#kXXX@XXXX.com
	 end
  end
end
