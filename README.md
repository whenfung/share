## 前期工作

- `view controller` 用于 `demo` 展示
- `Share-Bridge-Header.h` 桥接文件，用于调用 `objc` 第三方库（第三方平台 `sdk` 大部分还是用 `objc` 编写的）

## QQ

- 导入 `QQ SDK`，注意删掉 `headers` 文件夹中的 `module.modulemap`、`TencentOpenApiUmbrellaHeader.h` 文件。（太多泪，这里不说了 🙊）
- 添加 `SDK` 依赖的系统库文件。（`WebKit.framework` 、`CoreTelephony.framework` 、`libsqlite3.tbd` 、`libz.tbd` 、`CoreGraphics.framework` 、`libiconv.tbd` 、`SystemConfiguration.framework` 、`Security.framework` ）
  - ⚠️ 如果不添加这些依赖库，是不能通过编译的，会报错，你可以逐个添加，看看报错是不是逐渐变少。
- 

