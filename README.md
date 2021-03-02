# LiveWaifuCore
本项目仍在建设中

并不是最终版本

## 简介

本项目是 LiveWaifuDekstop 的核心项目

该项目包装了 Live2DNative-OpenGL 的底层框架

并且自主实现了基于GLFW的透明窗口 

并以动态链接库的方式输出给Windows程序使用

本程序提供了一个最简化的在Windows平台上运行的DLL库

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

#### 推荐：使用Release

直接下载Release中的最新版本DLL

然后在任何可以调用类库的语言中引入dll

以C#为例：

```c#
        [DllImport("LiveWaifuCore.dll")]
        public static extern bool live2dInit();
```

另开一个线程载入Live2D模型：

```c#
        public static void CallToChildThread()
        {
            live2dInit();
        }
        static void Main(string[] args)
        {
            ThreadStart childref = new ThreadStart(CallToChildThread);
            Thread childThread = new Thread(childref);
            childThread.Start();
        }

```

#### 自行编译

下载项目到本地，打开LiveWaifuCore/OpenGL/Demo/proj.win.cmake/build/proj_msvc2019_x86_md/LiveWaifuCore.sln

#### 自行构建 （Cmake）

安装cmake

下载Live2D-SDK

运行 proj.win.cmake/scripts/ 下的构建脚本

之后将本项目 src/ 下的代码复制到 构建好的项目下

## TO-DO

- 依赖于 GLFW的跨平台性 添加对 linux 的支持
- 添加触摸支持

