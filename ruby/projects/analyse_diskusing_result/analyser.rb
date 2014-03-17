class Anlyser
    attr_accessor :filepath
    def initialize(str)
        @filepath = str
    end
    def anlysis
        "Anlyser anlysising!" 
    end
    def show 
        File.open(@filepath, "r") { |file| p file.read   }        
    end
end

class DFAnlyser < Anlyser
    def anlysis
        p "DFAnlyser anlysising! "
        File.open(@filepath, "r") { |io|  
            io.readlines[2].chomp.split[-2]
        } 
    end
end


class JobsDUAnlyser < Anlyser
    def anlysis
        p "JobsDUAnlyser anlysising! "

        h = {}
        File.open(@filepath, "r") { |io|  
            io.readlines.each do |line|
                job = line.chomp.split
                key = toKB(job[0]) + h.size*0.00001
                value = job
                h[key] =value
            end
        } 
        Hash[h.sort.reverse].values
    end
    private 
    def toKB sizeStr
        size = sizeStr[0..-2].to_f
        if sizeStr[-1] == "G" then
            size*1000*1000
        elsif sizeStr[-1] == "M" then
            size*1000
        else 
            size
        end
    end    
end


class TimestampAnlyser < Anlyser
    def anlysis
        p "TimestampAnlyser anlysising! "
        time = "Time: "
        File.open(@filepath, "r") { |io|  
            time_parts = io.readline.split
            p "time_parts" + time_parts.to_s 
            time << "#{time_parts[0]}, #{time_parts[-1]} #{time_parts[1]} #{time_parts[2]}."
        } 
    end
end

class TemplateToHTML

    def initialize html_filepath, template_filepath="report_template.html"
        @html_filepath = html_filepath
        @template_filepath = template_filepath 
        @replace_hash = {_STATUS:"_doing_anlysis" }
    end

    def generate_html
        File.open(@html_filepath, "w") { |file|
            html_content = File.read(@template_filepath)
            @replace_hash.each do |k,v|
                html_content.gsub!(/(#{k})/,v) 
            end
            file << html_content
        }
    end

    def show
        p @replace_hash
    end
 
    def add k,v
        @replace_hash[k] = v
    end

end

a = Anlyser.new("df_diskusing.txt")
a.show 
p a.anlysis 


p "---------------------------"
df = DFAnlyser.new "df_diskusing.txt"
df.show
df_diskusing =  df.anlysis

p "---------------------------"
jobs = JobsDUAnlyser.new "jobs_diskusing.txt"
jobs.show
top10 = jobs.anlysis[1..10]

p "---------------------------"
ts = TimestampAnlyser.new "timestamp.txt"
ts.show
time = ts.anlysis


p "xxxxxxxxxxxxxxxxxxxxxxxxxx"
p df_diskusing
p top10
p time



t = TemplateToHTML.new ("master_report.html")
t.show
t.add("_TOTAL_DISK_USING",df_diskusing)
t.add("_CREATE_AT", time)


top10.each_with_index do |topx,i|
    t.add( "_JOB#{i}_DISK_USING" , topx.to_s )
end


t.generate_html
t.show