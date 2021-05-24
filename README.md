## 前期工作

- `view controller` 用于 `demo` 展示
- `Share-Bridge-Header.h` 桥接文件，用于调用 `objc` 第三方库（第三方平台 `sdk` 大部分还是用 `objc` 编写的）

## QQ

- 导入 `QQ SDK`，注意删掉 `headers` 文件夹中的 `module.modulemap`、`TencentOpenApiUmbrellaHeader.h` 文件。（太多泪，这里不说了 🙊）
- 添加 `SDK` 依赖的系统库文件。（`WebKit.framework` 、`CoreTelephony.framework` 、`libsqlite3.tbd` 、`libz.tbd` 、`CoreGraphics.framework` 、`libiconv.tbd` 、`SystemConfiguration.framework` 、`Security.framework` ）
  - ⚠️ 如果不添加这些依赖库，是不能通过编译的，会报错，你可以逐个添加，看看报错是不是逐渐变少。
- `Build Settings` 中的 `Other Linker Flags` 项中，添加 `-fobjc-arc`
- `Info` 的 `URL Types` 中添加 `URL Scheme` ，`identifier` 为 `tencentOpenAPI`，`URL Schemes` 为 `tencent222222`。
- 在 `info.plist` 中配置 `LSApplicationQueriesSchemes`，其中 `Type` 为 `Array`，包括 `mqq` 、`mqqapi` 、`mqqopensdkapiv2` 、`mqqopensdknopasteboard`
  - ⚠️ 如果某个 `scheme` 没有配置，那么运行的时候会报错提示某个 `scheme` 没有配置
- 重写 `AppDelegate` 的 `handleOpenURL` 和 `openURL` 方法
  - ⚠️  如果上个操作没有配置对应的 `scheme`，`openURL` 会报错
- `TencentSessionDelegate` 协议
- 初始化 `iOS SDK API` 数据对象 `TencentOauth`

