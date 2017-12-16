
# 一般通过$?来获取上一个语句的输出。看一下下面得测试语句：
return_string(){
	return $1
}
# return本身是shell里面的buildin函数，他有以下几个特征：
#   return可以返回数字状态，常常用于返回0，1,标识一个函数执行后是否成功
#   注意return不可以返回非数字类型
#   同时数字类型也有可能发生溢出现象(0~255)
return_string $1
result=$?
echo "result=$result"

# 如果我们就是要返回一个字符串，怎么办呢？
#   可以通过定义全局变量来进行赋值，类似于静态变量/成员变量的写法，我们让他的作用于穿透整个上下文。
result_g=""
return_string_g(){
	result_g=$1
}
return_string_g $1
echo "result=$result_g"
# 这样写，会污染全局变量，并且result这个变量很容易在内部和外部都被修改，导致内部修改失效。

# 除了return，还有其他一些buildin的关键字，比如eval，local。
# 默认在当前脚本定义的变量都是全局变量，在方法中则可以通过local来定义局部变量，这样可以避免全局变量污染.
# 同时结合eval赋值语句，来实现变量的修改
return_string_eval(){
	local __result=$2
	eval $__result=$1
}
return_string_eval $1 result
echo "result=$result"

# 通过echo输出，结合command substitution。 这个command substitution也没有找到比较合适的翻译，姑且按字面意思翻译命令替换。
return_string_echo(){
	local __result=$1
	echo $__result
}
# 或者 result=`return_string_echo $1`
result=$(return_string_echo $1)
echo "result=$result"
