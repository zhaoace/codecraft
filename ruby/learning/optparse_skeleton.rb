#!/usr/bin/env ruby
p 'portal.rb'


require 'optparse'



options = {}


option_parser = OptionParser.new do |opts|

    # 这里是这个命令行工具的帮助信息
    opts.banner = 'Here is help message of the command line tool.'

    # Option 作为switch，不带argument，用于将 switch 设置成 true 或 false
    options[:switch] = false

    # 下面第一项是 Short option（没有可以直接在引号间留空），第二项是 Long option，第三项是对 Option 的描述
    opts.on('-s', '--switch' , 'Set options as switch') do |value|
        # 这个部分就是使用这个Option后执行的代码
        options[:switch] = value
    end


    # Option 作为 flag，带argument，用于将argument作为数值解析，比如"name"信息
    #下面的“value”就是用户使用时输入的argument
    opts.on('-n Name', '--name Name', 'Pass-in single name') do |value|
        options[:name] = value
    end


    # Option 作为 flag，带一组用逗号分割的arguments，用于将arguments作为数组解析
    opts.on('-a A,B', '--array A,B' , Array , 'List of arguments') do |value|
        options[:array] = value
    end


end.parse!



p options.inspect




