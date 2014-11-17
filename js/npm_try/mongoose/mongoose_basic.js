// https://cnodejs.org/topic/504b4924e2b84515770103dd

var mongoose = require('mongoose'); //引用mongoose模块


mongoose.connect('localhost', 'test'); //创建一个数据库连接
var db = mongoose.connection;

var PersonSchema; //Person的文本属性
var PersonModel; //Person的数据库模型
var PersonEntity; //Person实体


db.on('error', console.error.bind(console, '连接错误:'));
db.once('open', function() {
    //一次打开记录
});


var PersonSchema = new mongoose.Schema({
    name: String //定义一个属性name，类型为String
});

var PersonModel = db.model('Person', PersonSchema);
//如果该Model已经发布，则可以直接通过名字索引到，如下：
//var PersonModel = db.model('Person');
//如果没有发布，上一段代码将会异常

var personEntity = new PersonModel({
    name: 'Krouky'
});
//打印这个实体的名字看看
console.log("打印这个实体的名字看看" + personEntity.name); //Krouky


//为Schema模型追加speak方法
PersonSchema.methods.speak = function() {
    console.log('我的名字叫' + this.name);
}
var PersonModel = db.model('Person', PersonSchema);
var personEntity = new PersonModel({
    name: 'Krouky'
});
personEntity.speak(); //我的名字叫Krouky



personEntity.save(); //执行完成后，数据库就有该数据了



PersonModel.find(function(err, persons) {
    //查询到的所有person
    console.log(persons);
});