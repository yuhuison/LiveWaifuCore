/**
 * Copyright(c) Live2D Inc. All rights reserved.
 *
 * Use of this source code is governed by the Live2D Open Software license
 * that can be found at https://www.live2d.com/eula/live2d-open-software-license-agreement_en.html.
 */
#include "windows.h"
#include "LAppDelegate.hpp"
#include "LAppDefine.hpp"
#include "LAppView.hpp"
#include "LAppLive2DManager.hpp"
BOOL WINAPI DllMain(
    _In_ HINSTANCE hinstDLL, // 指向自身的句柄
    _In_ DWORD ul_reason_for_call, // 调用原因
    _In_ LPVOID lpvReserved // 隐式加载和显式加载
) {
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
		
		break;
	case DLL_THREAD_ATTACH:
		break;
	case DLL_THREAD_DETACH:
		break;
	case DLL_PROCESS_DETACH:
		break;
	}
	return TRUE;
}

extern "C" __declspec(dllexport) int live2dInit()
{
    // create the application instance
    if (LAppDelegate::GetInstance()->Initialize() == GL_FALSE)
    {
        return 1;
    }

    LAppDelegate::GetInstance()->Run();

    return 0;
}
extern "C" __declspec(dllexport) int setRenderSize(int w ,int h)
{
	LAppDefine::SetRenderSize(w,h);

    return 0;
}
extern "C" __declspec(dllexport) int sendMouseMoveEvent(int x, int y)
{
	LAppDelegate::GetInstance()->OnMouseCallBackEx(x, y);
	return 0;
}

extern "C" __declspec(dllexport) int setWindowLoadedCallBack(int callback)
{
	LAppDefine::SetCallBack_windowLoaded(callback);
	return 0;
}

extern "C" __declspec(dllexport) int setModel(std::string modelName)
{
	LAppDefine::setFirstModel(modelName);
	return 0;
}

int main() {
	setRenderSize(500,500);
	live2dInit();
}

