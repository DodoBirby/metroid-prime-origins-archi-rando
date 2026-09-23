#define WIN32_LEAN_AND_MEAN
#include <windows.h>

__declspec(dllexport) double mpo_mouse_confine(double enabled)
{
    if (enabled < 0.5)
    {
        return ClipCursor(NULL) ? 1.0 : 0.0;
    }

    HWND window = GetForegroundWindow();
    DWORD process_id = 0;
    if (!window || !GetWindowThreadProcessId(window, &process_id)
        || process_id != GetCurrentProcessId())
    {
        ClipCursor(NULL);
        return 0.0;
    }

    RECT client;
    if (!GetClientRect(window, &client))
    {
        ClipCursor(NULL);
        return 0.0;
    }
    SetLastError(ERROR_SUCCESS);
    if (!MapWindowPoints(window, NULL, (POINT *)&client, 2)
        && GetLastError() != ERROR_SUCCESS)
    {
        ClipCursor(NULL);
        return 0.0;
    }
    return ClipCursor(&client) ? 1.0 : 0.0;
}
