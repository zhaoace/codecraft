class Keywords
    module Type
      PATH         =           0x1
      FAST         =           0x2
    end

    def self.load_paths
        my_fav_paths =[]
        File.readlines("my_fav_paths.txt").each do |line|
            my_fav_paths << line
        end
    end
    @my_fav_paths = self.load_paths()
    def self.my_fav_paths
        @my_fav_paths
    end

    def self.set_data
        data = []
        @my_fav_paths.each do |my_fav_path|
            data << [ Type::PATH, "time" , my_fav_path]
        end
        return data
    end
    @kw_data = self.set_data()
    def self.kw_data
        return @kw_data
    end

    def self.guess key
        result = []
        keys = key.split
        if keys.size >=1  then
            reg = ''
            keys.each do |x|
                reg += ".*#{x}.*"
            end

        end

        @kw_data.each do |kwdata|
            kw_match = /#{reg}/i.match(kwdata[2])
            result <<  kw_match.to_s if kw_match
        end
        return result
    end


end
