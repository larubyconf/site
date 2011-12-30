namespace :export do
  desc "Create Proposals CSV file."
  task(:proposals => :environment) do
    puts "Creating CSV file of the Proposals"
    csv_data = Proposal.dump
    file_name = "#{Time.now.strftime("%Y%m%d-%H%M%S")}-proposal-export.csv"
    File.open(file_name,"w") do |csv|
      csv << csv_data
    end
    puts "Export of the proposals has been written to: #{file_name}"
  end
end
