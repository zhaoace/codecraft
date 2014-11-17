var mongoose = require('mongoose'); //引用mongoose模块


mongoose.connect('localhost', 'branchesmanger');
var db = mongoose.connection;
var branchSchema; //branch的文本属性
var branchModel; //branch的数据库模型
var branchEntity; //branch实体



// db.on('error', console.error.bind(console, '连接错误:'));



var branchSchema = new mongoose.Schema({
    name: String,
    owner: String,
    from: String,
    created_date: Date,
    expire_date: Date
});

var branchModel = db.model('branch', branchSchema);


var branchEntity = new branchModel({
    name: 'master',
    owner: 'scm',
    from: 'master',
    created_date: new Date(),
    expire_date: new Date()
});

console.log("打印这个实体的名字看看" + branchEntity.name);



db.once('open', function() {
    console.log("It's opened!!!");



});

