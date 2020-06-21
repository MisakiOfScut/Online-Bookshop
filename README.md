*****************************架构技术*******************************
架构：MVP架构（特别说明一下之前的几次迭代的架构都是MVP，只是把Presenter错误的命名成了Controller），前后端(半)分离
技术栈：html、js(部分使用jQuery框架)、Ajax、css（bootstrap框架）、php

***********************项目文件结构****************************
WWW/bookshop文件夹/

	include （php文件需要包含的（初始化）文件）
		->config.php 连接数据库信息配置
		->init.php 初始化设置
		->router.php  根据服务器htacess配置文件所有非访问文件的url会被导向此处，功能未完善。参考了thinkphp的架构，控制器类在路由文件实例化并完成操作，目前只实现了GET，POST未实现

	Model（php类文件 Model）
		->Model.class.php 封装sql基础操作
		->BookDescriptionModel.class.php 封装对书籍的一些业务操作
		->UserModel.class.php 继承Model，封装用户登录注册的业务操作
		->jwtToken.class.php 封装生成/验证token的操作，Java Web Token，用运算验证替代session的存储验证

	view （前端html文件 View）
		->adminSys(后台管理系统)    //为了方便写js部分还没分出去另外的文件，所以你会看到长长的js脚本
			->bookadd.html 添加书籍页（增）
			->booklist.html 书籍列表展示页（查、改、删）
			->adminlogin.html 管理员登录页
		->firstPage.html 主页
		->searchPage.html 搜索页
		->information.html 书籍详情页

	adminSys （Presenter类文件）//这里的命名其实不规范，文件名称应以Presenter结尾
		->bookaddAct.php 添加书籍信息
		->modifybook.php 修改单本书的信息
		->delbook.php 删除单本书
		->adminlogin.php 管理员登录

	bookshop(书店Presenter)
		->getonebook.php 请求单本书的信息
		->showlist.php 请求书籍列表信息

	data （存储数据）
		->img（存储网页图片）

	lib（css、js库）

	index.html （定向到打开域名显示的主页，单纯为了配合.htaccess文件）
	.htaccess（apache服务器配置文件，实现url改写、域名绑定主页等等等功能的地方）

******************************phpstudy安装事项*************************
安装phpstudy会卸载你本地的mysql服务，只需要重装服务即可（不是整个重装！！）
那么你要以管理员方式打开dos窗口，进入自己安装的mysql文件夹中进入bin目录，输入：
mysqld.exe -install           出现：Service successfully installed.
接下来启动mysql：
net start mysql                出现：MySQL 服务正在启动 ..   MySQL 服务已经启动成功。
然后本地安装的mysql就可以使用了。

***************************下面都是开发时的一些总结******************************
注意：
表名 - booklist 
书籍信息提交文件和简介可以为空，不过不会显示成功，各种返回的code含义看php文件，1都是成功值
插入的图片尽量不要用中文，utf8的力量是有限哒
***********************************************************
debug方法个人总结：
1、通过浏览器cmd调试，一般是用console.log()方法检查页面数据传递等等
2、通过返回不同json代码给js检查前端数据到后端的问题（多捞的方法啊
3、通过直接运行编写的测试文件，用var_dump()函数检查数据，检查后端到数据库的问题
****************************************************
如果再多说几句关于相对路径的，一定要注意相对路径是相对于谁的相对路径，相对路径是相对于目标目录的相对路径，这个目标目录，可以自己设置，如果没有设置，那就是当前目录为基准目录，include，require这两个函数，相当于在当前脚本中引入了其他文件，但是执行过程，还是在当前脚本中，所以引入文件的相对目录的基准就变成了当前脚本的目录，所以弄清楚这个概念。

还有一点，文件的相对目录都是相对于第一个入口的相对目录！！！！！ 

另外很多人喜欢说入口文件，这个入口文件其实就是引入其他脚本 html css的文件。并不是什么进入项目的index.php

如果你用php引入了一个html文件（前后端不分离方法，前端实际在php脚本中运行），
那么这个文件中的相对路径是相对于php文件的！！！
但如果你从这个页面跳转到另一个html页面，那么路径有变成相对这个HTML文件的了

前后端分离的情况下，路径相对于html文件（本项目采用的方法，采用ajax方法与后台php交互）
**********************************
含有变量的string最好使用`sentence...${var }`这种括号 （php除外）
**********************************
如果用getElementsBy方法获取表单对象，表单在input标签必须有name项，否则表单对象会没有数据


？你居然看到了最后，接触php一个月发现我还是喜欢Java，新手上路没用框架架构有不合理之处请多多包涵
不过php建站速度确实快，虽然很多架构、业务逻辑真的是要从无到有去学