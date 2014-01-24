require "./SomeModuleFile.rb"


# p SomeModule::Constant
# p SomeModule::SomeClass.new.hello
# p SomeModule::speak
# p SomeModule.speak
# p speak

p SomeModule::InnerModule::Constant


include SomeModule
p Constant
p speak
p InnerModule


