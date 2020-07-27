
require 'csv'
class Gossip
    attr_accessor :author, :content
    def initialize(author, content)
        @author = author
        @content = content

    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]
        end 
    end

    def self.all 
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
            all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end
    
    def self.find(id)
        dis_gossip = []
        CSV.read("./db/gossip.csv").select.with_index {|csv_line, i| dis_gossip << Gossip.new(csv_line[0], csv_line[1]) if i == id}
        return dis_gossip               
        
    end
    
end



