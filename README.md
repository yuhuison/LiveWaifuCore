# LiveWaifuCore
本项目仍在建设中

并不是最终版本

## 简介

本项目是 LiveWaifuDekstop 的核心项目

该项目包装了 Live2DNative-OpenGL 的底层框架

并以动态链接库的方式输出给Windows程序使用

提供的API：

| 函数名称                                | 功能                                                   | 备注 |
| --------------------------------------- | ------------------------------------------------------ | ---- |
| setFirstModel()                         | 设置首个播放的模型名称                                 |      |
| changeModel(string modelName)           | 改变当前渲染的模型                                     |      |
| playMotion(string motionName)           | 播放某个指定的动作                                     |      |
| setResPath(string path)                 | 指定资源所在的路径                                     |      |
| onWindowLoaded(void function(int hWnd)) | 窗口载入时回调                                         |      |
| onModelLoaded(void function(int hWnd))  | 模型载入时回调                                         |      |
| setRenderSize(int width, int height)    | 设置渲染窗口大小                                       |      |
| live2dInit()                            | 设置好以上参数后，调用该命令初始化并进入live2d消息循环 |      |



### 如何使用？

下载