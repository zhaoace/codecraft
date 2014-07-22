



class Keywords






    module Type
      PATH         =           0x1
      FAST         =           0x2
    end



    def self.kw_data
        return @kw_data
    end
    @kw_data =[
        [Type::PATH, "WDF dropzone","\\\\build-drops-wdf.pgdev.sap.corp\\dropzone\\components",],
        [Type::PATH, "WDF cvom4.0","\\\\build-drops-wdf.pgdev.sap.corp\\dropzone\\components\\cvom_4.0",],
        [Type::PATH, "WDF cvom_3.3","\\\\build-drops-wdf.pgdev.sap.corp\\dropzone\\components\\cvom_3.3",],
        [Type::PATH, "WDF cvom_trunk_pi","\\\\build-drops-wdf.pgdev.sap.corp\\dropzone\\components\\cvom_trunk_pi",],
        [Type::PATH, "WDF cvom_trunk_dev","\\\\build-drops-wdf.pgdev.sap.corp\\dropzone\\components\\cvom_trunk_dev",],
        [Type::PATH, "SHG cvom4.0","\\\\cnshgvi02.pvgl.sap.corp\\Builds\\components\\cvom_4.0",],
        [Type::PATH, "SHG cvom_3.3","\\\\cnshgvi02.pvgl.sap.corp\\Builds\\components\\cvom_3.3",],
        [Type::PATH, "SHG cvom_trunk_pi","\\\\cnshgvi02.pvgl.sap.corp\\Builds\\components\\cvom_trunk_pi",],
        [Type::PATH, "SHG cvom_trunk_dev","\\\\cnshgvi02.pvgl.sap.corp\\Builds\\components\\cvom_trunk_dev",],
        [Type::PATH, "VC aurora41_pi_xcelsius ","\\\\build-drops-vc.pgdev.sap.corp\\dropzone\\aurora_dev\\aurora41_pi_xcelsius",],
        [Type::PATH, "VC aurora41_sp_cor ","\\\\build-drops-vc.pgdev.sap.corp\\dropzone\\aurora_dev\\aurora41_sp_cor",],
    ]



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
            kw_match = /#{reg}/.match(kwdata[2])
            result <<  kw_match.to_s if kw_match
        end
        return result
    end


end


