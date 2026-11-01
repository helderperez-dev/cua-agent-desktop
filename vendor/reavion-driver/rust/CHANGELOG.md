# Changelog

## [0.38.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.37.0...reavion-driver-rs-v0.38.0) (2026-10-20)


### Features

* **sdk:** publish cua-sdk and the proto contract so you can build your own harness (CUA-1902) ([#5532](https://github.com/helderperez-dev/reavion-driver/issues/5532)) ([78175bd](https://github.com/helderperez-dev/reavion-driver/commit/78175bd5d425c4945df8887aa308bfafd682cd2b))


### Bug Fixes

* At the polling deadline, classify the same bound target only when the result would otherwise be zero delivery. Web targets return unverifiable without delivered_chars or retry fields. This applies to background key_events and foreground key_events_fg. Native zero delivery, completion, positive partial counts, and polling deadlines remain unchanged. Positive partial counts in self-clearing web fields are outside this fix. ([3133bbb](https://github.com/helderperez-dev/reavion-driver/commit/3133bbbff53a1eb07a919ff9973851eb44a3c129))
* **reavion-driver:** accept the GNOME helper only from the session's Shell ([da87d3d](https://github.com/helderperez-dev/reavion-driver/commit/da87d3d92f41b934103c82a312834c92b856ce4f))
* **reavion-driver:** avoid unsafe zero-delivery retry advice for macOS web typing ([3133bbb](https://github.com/helderperez-dev/reavion-driver/commit/3133bbbff53a1eb07a919ff9973851eb44a3c129)), closes [#5354](https://github.com/helderperez-dev/reavion-driver/issues/5354)
* **reavion-driver:** classify DOM click effects with readback ([1bf24b8](https://github.com/helderperez-dev/reavion-driver/commit/1bf24b83ed9d757adc5cccd6c5b03d4fcb4dd7c1))
* **reavion-driver:** deliver window-only foreground hotkeys through the HID activation guard ([a4b5fec](https://github.com/helderperez-dev/reavion-driver/commit/a4b5fec16a25d0206d075203c723404100a8043e))
* **reavion-driver:** discover native Wayland windows in desktop snapshots ([a038036](https://github.com/helderperez-dev/reavion-driver/commit/a038036c705a34e31e2a36f63a9abcecf6b04a6f))
* **reavion-driver:** fix Windows selected-browser launch guidance ([50313e7](https://github.com/helderperez-dev/reavion-driver/commit/50313e7a7475846a459048b89758e6d0bc14df6d))
* **reavion-driver:** handle Add-Type failure on non-ASCII locales ([cb213ef](https://github.com/helderperez-dev/reavion-driver/commit/cb213efb082d88f297283bb95663791a2fc466e3))
* **reavion-driver:** keep an ended session's master pointer until its popup menu closes ([a08193a](https://github.com/helderperez-dev/reavion-driver/commit/a08193ac91528bde303fb27c60047997e9f91ed4)), closes [#4965](https://github.com/helderperez-dev/reavion-driver/issues/4965)
* **reavion-driver:** keep GNOME element actions inside the requested window ([3bfe6ca](https://github.com/helderperez-dev/reavion-driver/commit/3bfe6ca4f092790cd07e02059864c84bbdf003a6))
* **reavion-driver:** let launch_app take the .app path that list_apps reports ([8ae3222](https://github.com/helderperez-dev/reavion-driver/commit/8ae3222b5939e1eb5a30c3178008e67ff1979e60))
* **reavion-driver:** never send a Windows foreground drag to the window covering the target ([36b6750](https://github.com/helderperez-dev/reavion-driver/commit/36b6750ffb05ecbd1ed4b64d82257948a98ff3a1))
* **reavion-driver:** recover rootless XWayland browser identities ([ef61a98](https://github.com/helderperez-dev/reavion-driver/commit/ef61a985d58958c6b9bc392f0ea0da785aa36ce9))
* **reavion-driver:** refuse unsafe GNOME 50+ helper startup ([53ffe13](https://github.com/helderperez-dev/reavion-driver/commit/53ffe137973edee3d4481d5fdba7469fc50c2717)), closes [#5416](https://github.com/helderperez-dev/reavion-driver/issues/5416)
* **reavion-driver:** report unknown tools accurately ([7d1e178](https://github.com/helderperez-dev/reavion-driver/commit/7d1e178522cf526512dfe3596612a3753cb46a85))
* **reavion-driver:** report Windows tree completeness ([d0eebf0](https://github.com/helderperez-dev/reavion-driver/commit/d0eebf0f4b527786282893ed7af0a76fca55b6c3))
* **reavion-driver:** restrict Windows launch candidates to the receipt process family ([0b235ad](https://github.com/helderperez-dev/reavion-driver/commit/0b235ad57c75ec9b8c7d56721d16c1d81b531855)), closes [#5450](https://github.com/helderperez-dev/reavion-driver/issues/5450)
* **reavion-driver:** retry unverified macOS window prefetches ([9799140](https://github.com/helderperez-dev/reavion-driver/commit/97991403b40d227c795ec4fd4e7b3ad7c873f21b))
* **reavion-driver:** scale Windows foreground scroll targets from the screenshot context ([e6de7c1](https://github.com/helderperez-dev/reavion-driver/commit/e6de7c1708afc1a3e1d3f549752bd40ec8f398d3))
* **reavion-driver:** stop macOS EINVAL flake in daemon client and settle capture/menu tests on conditions ([#5558](https://github.com/helderperez-dev/reavion-driver/issues/5558)) ([44f4795](https://github.com/helderperez-dev/reavion-driver/commit/44f47953a422d87593a7ba9a48020799f22e2548)), closes [#4357](https://github.com/helderperez-dev/reavion-driver/issues/4357)
* **reavion-driver:** suspend the target GUI thread while posting a Windows click ([de1ba41](https://github.com/helderperez-dev/reavion-driver/commit/de1ba418274ebb5215a28e32b2e2840440aff4f2))
* **reavion-driver:** track cursor placement explicitly ([88e6d9f](https://github.com/helderperez-dev/reavion-driver/commit/88e6d9facd33e2c258e0f9a0ba4d9b2bac51cd97))
* **reavion-driver:** undo the GTK4 CSD inset before at-point ownership checks ([1bc57bd](https://github.com/helderperez-dev/reavion-driver/commit/1bc57bd018e2adf8fc89476d7d9ff3f87ce04e9d))
* **reavion-driver:** verify foreground Document text insertion ([0525de1](https://github.com/helderperez-dev/reavion-driver/commit/0525de1e6439f1e4f0edba68660b3350ac20716d))
* **reavion-driver:** Windows list_windows omits the driver's own overlay windows ([9370532](https://github.com/helderperez-dev/reavion-driver/commit/9370532e8841d39728d5a9aa8fd03b13a54490f9))
* extract snapshot selection into a host-testable module and select only the receipt root and transitive descendants, including renamed children. Preserve the public API, exited-root ordering, list_descendants behavior (including PID 0), explicit UWP host resolution, and original receipt PID with empty windows when no eligible fallback exists. Remove the unused version-prefix matcher. ([0b235ad](https://github.com/helderperez-dev/reavion-driver/commit/0b235ad57c75ec9b8c7d56721d16c1d81b531855))
* Refuse GNOME 50 and newer before allocating resources, stop advertising GNOME 50 support, and document disabling existing helpers. Preserve GNOME 45–49 and API 10. This contains the risk without claiming to fix the native crash. ([53ffe13](https://github.com/helderperez-dev/reavion-driver/commit/53ffe137973edee3d4481d5fdba7469fc50c2717))
* Reuse verified prefetches; otherwise capture and validate once after the walk. Reads without a prefetch still capture exactly once. Keep bounds lookup, resizing, file output, snapshot publication and the capture_id gate unchanged, retaining degradation if recovery fails. Net production change: +22 lines, in one file. ([9799140](https://github.com/helderperez-dev/reavion-driver/commit/97991403b40d227c795ec4fd4e7b3ad7c873f21b))
* **security:** distrust the compromised eMudhra intermediates in every Cua client (CUA-1948) ([#5622](https://github.com/helderperez-dev/reavion-driver/issues/5622)) ([149ea51](https://github.com/helderperez-dev/reavion-driver/commit/149ea51c613cc840c3760dec822c57b7e65df05a))
* Track placement explicitly in shared render state and use it across macOS, Windows, X11, and Wayland. Position getters return None for absent/unplaced cursors. Preserve existing seeding clamps and main-screen clipping. ([88e6d9f](https://github.com/helderperez-dev/reavion-driver/commit/88e6d9facd33e2c258e0f9a0ba4d9b2bac51cd97))

## [0.37.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.36.0...reavion-driver-rs-v0.37.0) (2026-10-20)


### Features

* **reavion-driver:** add browser_select for native HTML select ([#5232](https://github.com/helderperez-dev/reavion-driver/issues/5232)) ([3df424f](https://github.com/helderperez-dev/reavion-driver/commit/3df424fafcd6823f9efba14df5b36038ddb2dcb5))
* **reavion-driver:** install the skill pack when setting up an agent, and add get_guide ([#5491](https://github.com/helderperez-dev/reavion-driver/issues/5491)) ([8637cae](https://github.com/helderperez-dev/reavion-driver/commit/8637cae79b3decfd8e9e43291a63ffab66bfb867))
* **reavion-driver:** let agents approve Cua Driver's macOS prompts when the owner authorizes it ([#5467](https://github.com/helderperez-dev/reavion-driver/issues/5467)) ([131063c](https://github.com/helderperez-dev/reavion-driver/commit/131063c0083b79ef5a0c6fd7ae059cd802549f70))
* **reavion-driver:** optional brief foreground step for native drag-and-drop on macOS ([#5481](https://github.com/helderperez-dev/reavion-driver/issues/5481)) ([5033e7e](https://github.com/helderperez-dev/reavion-driver/commit/5033e7ed3fd255b7d362517c73f3ba2f5a4dc56f))
* **reavion-driver:** recovery hints on refusals and unverifiable results ([#5493](https://github.com/helderperez-dev/reavion-driver/issues/5493)) ([ac6f7c2](https://github.com/helderperez-dev/reavion-driver/commit/ac6f7c21edc15b4113b493da22df836db32f9800)), closes [#5475](https://github.com/helderperez-dev/reavion-driver/issues/5475)


### Bug Fixes

* **reavion-driver:** ask for macOS's direct-capture consent during setup, not over the user's window (CUA-1792) ([#5352](https://github.com/helderperez-dev/reavion-driver/issues/5352)) ([a75d1c2](https://github.com/helderperez-dev/reavion-driver/commit/a75d1c2e9ba205b3d41d9094b419bc1412dae35c))
* **reavion-driver:** count a bundle-identifier capture approval as consent (fixes hosted macOS preflight) ([#5402](https://github.com/helderperez-dev/reavion-driver/issues/5402)) ([8347d6c](https://github.com/helderperez-dev/reavion-driver/commit/8347d6cd849b87bbb4a40b30494d6f53f417e34a))
* **reavion-driver:** deliver background drags in Electron windows through the main process (CUA-1207) ([#5351](https://github.com/helderperez-dev/reavion-driver/issues/5351)) ([24f6fc0](https://github.com/helderperez-dev/reavion-driver/commit/24f6fc04d892468defc1f6efff1db5df91e1c369))
* **reavion-driver:** derive the macOS desktop point ratio from the display mode instead of a screenshot ([#5340](https://github.com/helderperez-dev/reavion-driver/issues/5340)) ([ac825f8](https://github.com/helderperez-dev/reavion-driver/commit/ac825f8b928716c3db690f10ad3d8281e98197bc))
* **reavion-driver:** don't open a background web &lt;select&gt;; steer to set_value (CUA-1795) ([#5353](https://github.com/helderperez-dev/reavion-driver/issues/5353)) ([add1383](https://github.com/helderperez-dev/reavion-driver/commit/add1383b0c60f72f4ec000c6283538f27b7ac4b3))
* **reavion-driver:** install Antigravity skills in IDE and CLI directories ([#5226](https://github.com/helderperez-dev/reavion-driver/issues/5226)) ([3bd8f65](https://github.com/helderperez-dev/reavion-driver/commit/3bd8f65896d0d876a512ae4ea41ae2607218ef79))
* **reavion-driver:** keep rendered controls visible in semantic_v2 and report not_rendered for background tabs ([#5256](https://github.com/helderperez-dev/reavion-driver/issues/5256)) ([a212cd0](https://github.com/helderperez-dev/reavion-driver/commit/a212cd026e260c6e397efd105726e20a2f914144))
* **reavion-driver:** keep the pointer out of macOS window screenshots ([#5480](https://github.com/helderperez-dev/reavion-driver/issues/5480)) ([757ae8c](https://github.com/helderperez-dev/reavion-driver/commit/757ae8cedb87f8c8d2441f748aee7236767b18a0))
* **reavion-driver:** launch the installed app by path, stop daemons from any copy, drop extra copies ([#5471](https://github.com/helderperez-dev/reavion-driver/issues/5471)) ([41eee2f](https://github.com/helderperez-dev/reavion-driver/commit/41eee2fb91c20a77a9e55e4f013fc968081ad74c))
* **reavion-driver:** leave focus on a dialog the clicked app opened ([6effe99](https://github.com/helderperez-dev/reavion-driver/commit/6effe99e5743487a8d8e38f522757efccf7d5c88))
* **reavion-driver:** let the client wait out the largest tool budget ([c2b2014](https://github.com/helderperez-dev/reavion-driver/commit/c2b20141b5607cab1b39ffaac4416d9978901da3))
* **reavion-driver:** list untitled X11 windows the window manager manages ([#5341](https://github.com/helderperez-dev/reavion-driver/issues/5341)) ([57a01e6](https://github.com/helderperez-dev/reavion-driver/commit/57a01e6fb4cbbb256749da5d0bb986569c2240cd))
* **reavion-driver:** match path-style app grants against the full executable path ([#5505](https://github.com/helderperez-dev/reavion-driver/issues/5505)) ([d126ec9](https://github.com/helderperez-dev/reavion-driver/commit/d126ec91e0d82a442e4a4363821c1f2062b87935))
* **reavion-driver:** refuse background menus bound to sibling windows ([d52ec6e](https://github.com/helderperez-dev/reavion-driver/commit/d52ec6ebea78a8b7fcbb1d56ef8cf72f9eedea22))
* **reavion-driver:** report a locked screen and keep the display awake while an agent works ([#5483](https://github.com/helderperez-dev/reavion-driver/issues/5483)) ([b1633ef](https://github.com/helderperez-dev/reavion-driver/commit/b1633ef91cb003ce1551c3f81accab173e7b603e))
* **reavion-driver:** uninstall keeps macOS permissions unless asked; release gate pins the app signing requirement ([#5460](https://github.com/helderperez-dev/reavion-driver/issues/5460)) ([14f2a81](https://github.com/helderperez-dev/reavion-driver/commit/14f2a811903e5fe0c34538f66eaf0f8950c835ee))
* **reavion-driver:** verify macOS target focus before dispatching keys ([#5372](https://github.com/helderperez-dev/reavion-driver/issues/5372)) ([8a66f0d](https://github.com/helderperez-dev/reavion-driver/commit/8a66f0d8d9553e3f5fdc52e265755aff0f06c5d3))


### Performance Improvements

* **reavion-driver:** faster batched steps and window reads, and a nudge to batch ([#5487](https://github.com/helderperez-dev/reavion-driver/issues/5487)) ([26330f7](https://github.com/helderperez-dev/reavion-driver/commit/26330f7edd04b00ac8bc63c13224766284451d91))
* **reavion-driver:** read macOS bundle plists in process ([#5369](https://github.com/helderperez-dev/reavion-driver/issues/5369)) ([231c953](https://github.com/helderperez-dev/reavion-driver/commit/231c953c08979b5f46d789a59117510fabfe4eb1))

## [0.36.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.35.4...reavion-driver-rs-v0.36.0) (2026-10-16)


### Features

* **reavion-driver:** background drag on macOS (CUA-1207) ([#5309](https://github.com/helderperez-dev/reavion-driver/issues/5309)) ([1dc9b52](https://github.com/helderperez-dev/reavion-driver/commit/1dc9b52bd0907c2b4abbf2558015069a45eff6c1))
* **reavion-driver:** publish isolated browser session lifetime in browser_prepare ([#5183](https://github.com/helderperez-dev/reavion-driver/issues/5183)) ([bf6ac21](https://github.com/helderperez-dev/reavion-driver/commit/bf6ac21d2d3c1ddcc015d981b681feb23758daa4))


### Bug Fixes

* **reavion-driver, spacesd:** say why a Windows desktop can't be captured (locked, RDP disconnected) (CUA-1727) ([#5266](https://github.com/helderperez-dev/reavion-driver/issues/5266)) ([a0c06f2](https://github.com/helderperez-dev/reavion-driver/commit/a0c06f20239424b8a9be19468dd3b902944f8ac5))
* **reavion-driver:** advertise coordinate scrolling support ([#5149](https://github.com/helderperez-dev/reavion-driver/issues/5149)) ([f53daa6](https://github.com/helderperez-dev/reavion-driver/commit/f53daa6c2a6f1c04ccbcf57adabccd0d7d43bba8))
* **reavion-driver:** background keyboard into editor surfaces and multi-window apps (CUA-1767) ([#5306](https://github.com/helderperez-dev/reavion-driver/issues/5306)) ([9867c0a](https://github.com/helderperez-dev/reavion-driver/commit/9867c0ae93404f2d8b3500dd1690d171cd5f54c7))
* **reavion-driver:** background menu/format controls and page reads on another Space (CUA-1768, CUA-1769) ([#5307](https://github.com/helderperez-dev/reavion-driver/issues/5307)) ([e08eb41](https://github.com/helderperez-dev/reavion-driver/commit/e08eb41e10decbc3fc540af12d68684c0d099dc3))
* **reavion-driver:** build macOS fixtures for the host architecture ([#5202](https://github.com/helderperez-dev/reavion-driver/issues/5202)) ([c93de1a](https://github.com/helderperez-dev/reavion-driver/commit/c93de1ae9c9164990564284b10405228ecd7f5a5))
* **reavion-driver:** drain autoreleased objects on SCK capture workers ([#5170](https://github.com/helderperez-dev/reavion-driver/issues/5170)) ([b6a8280](https://github.com/helderperez-dev/reavion-driver/commit/b6a8280d6ff719a94f22cac06bc6951a1bdb4b74))
* **reavion-driver:** fail loudly when the unbundled daemon has no WindowServer connection (CUA-1777) ([#5333](https://github.com/helderperez-dev/reavion-driver/issues/5333)) ([73c3f0b](https://github.com/helderperez-dev/reavion-driver/commit/73c3f0b836d35fa49870704c9f2254709838c60c))
* **reavion-driver:** honor --pid-file in reavion-driver status ([#5246](https://github.com/helderperez-dev/reavion-driver/issues/5246)) ([bab00b7](https://github.com/helderperez-dev/reavion-driver/commit/bab00b7b4039ee0be89ee1c828268103fa8b87d5)), closes [#4689](https://github.com/helderperez-dev/reavion-driver/issues/4689)
* **reavion-driver:** keep the current tab's page out of the Chrome setup proof ([#5343](https://github.com/helderperez-dev/reavion-driver/issues/5343)) ([c9ab131](https://github.com/helderperez-dev/reavion-driver/commit/c9ab131a1d2207a81c9cc220f370697ddc8a2f86))
* **reavion-driver:** let CUA_LOG=info and debug raise the log level ([3f70341](https://github.com/helderperez-dev/reavion-driver/commit/3f70341ee1e42c5b32e22c1ce1483ceeba0a5831))
* **reavion-driver:** list window rows in list_windows text content ([#5211](https://github.com/helderperez-dev/reavion-driver/issues/5211)) ([b346685](https://github.com/helderperez-dev/reavion-driver/commit/b346685ed00fe665fff014b7fdb5d18fba41adc8))
* **reavion-driver:** make the addressed LibreOffice window key without activating (CUA-1767) ([#5319](https://github.com/helderperez-dev/reavion-driver/issues/5319)) ([01cb136](https://github.com/helderperez-dev/reavion-driver/commit/01cb13655d047ac4f0c7a8a9e1176220ba9f4eb0))
* **reavion-driver:** print actionable PATH install hints ([#5219](https://github.com/helderperez-dev/reavion-driver/issues/5219)) ([2e644e9](https://github.com/helderperez-dev/reavion-driver/commit/2e644e9f6540a77f70ab4e16a23b4e671b7c6129)), closes [#3004](https://github.com/helderperez-dev/reavion-driver/issues/3004)
* **reavion-driver:** refuse background drags in Electron windows and fix the AppKit drag cell ([#5335](https://github.com/helderperez-dev/reavion-driver/issues/5335)) ([2dab1f2](https://github.com/helderperez-dev/reavion-driver/commit/2dab1f2a6703d28a9475259a822220436cd3ce91))
* **reavion-driver:** refuse unconfirmed macOS Electron scrolls ([#5251](https://github.com/helderperez-dev/reavion-driver/issues/5251)) ([fca488d](https://github.com/helderperez-dev/reavion-driver/commit/fca488d88b30eb00c11dc4b2ea526b62c3886e02))
* **reavion-driver:** report actual browser delivery mode in public results ([#5222](https://github.com/helderperez-dev/reavion-driver/issues/5222)) ([6e48c33](https://github.com/helderperez-dev/reavion-driver/commit/6e48c3347a2d857ba47c5ec62e887fdf64ab65c0)), closes [#5220](https://github.com/helderperez-dev/reavion-driver/issues/5220)
* **reavion-driver:** report every layer when list_windows is given a pid ([#5162](https://github.com/helderperez-dev/reavion-driver/issues/5162)) ([e6bc5f9](https://github.com/helderperez-dev/reavion-driver/commit/e6bc5f93afe5d17b7c4c8ceaa4cbfd100830c0c7))
* **reavion-driver:** report Linux and Windows permissions status instead of "not granted" ([1ff756b](https://github.com/helderperez-dev/reavion-driver/commit/1ff756bd79856ef4c34b180ea1a6fb36ca368d73))
* **reavion-driver:** resolve launch_app to the app window, not a launcher splash ([#5342](https://github.com/helderperez-dev/reavion-driver/issues/5342)) ([1d114c2](https://github.com/helderperez-dev/reavion-driver/commit/1d114c21f95f485402bbea5de10b7dd78a1fe166))
* **reavion-driver:** skip web content during Chrome consent scans ([#5216](https://github.com/helderperez-dev/reavion-driver/issues/5216)) ([3722b11](https://github.com/helderperez-dev/reavion-driver/commit/3722b11a4fe4879c5cf43fc540fd0f2e5108dfc6)), closes [#4630](https://github.com/helderperez-dev/reavion-driver/issues/4630)
* **reavion-driver:** stop a batched text before rebinding keycodes the client has not confirmed reading ([#5244](https://github.com/helderperez-dev/reavion-driver/issues/5244)) ([6d82b3b](https://github.com/helderperez-dev/reavion-driver/commit/6d82b3b1b21813ad047f966ab1384a1258c16170))
* **reavion-driver:** stop background actions from raising Chrome or re-activating the user's app (CUA-1309, CUA-1791) ([#5334](https://github.com/helderperez-dev/reavion-driver/issues/5334)) ([ffd6504](https://github.com/helderperez-dev/reavion-driver/commit/ffd65042bf0bd1605749e393e36f23d0868bf8fe))
* **reavion-driver:** stop worker and embedded processes launching Orca on GNOME ([#5179](https://github.com/helderperez-dev/reavion-driver/issues/5179)) ([c2a42ea](https://github.com/helderperez-dev/reavion-driver/commit/c2a42eaaf723ed5aee6d9ee2e0fb0808c896c882))
* **reavion-driver:** type long Linux text in spare-keycode batches ([#5168](https://github.com/helderperez-dev/reavion-driver/issues/5168)) ([8be7052](https://github.com/helderperez-dev/reavion-driver/commit/8be7052a063aacb58c4d743b4e7efa3afd78143a))
* **reavion-driver:** wait for Chrome web content on first read; point background browser_prepare refusals to the AX route (CUA-1766) ([#5305](https://github.com/helderperez-dev/reavion-driver/issues/5305)) ([4f70845](https://github.com/helderperez-dev/reavion-driver/commit/4f7084573e77b36a4a5706c7249a1e4116b9b334))
* **reavion-driver:** wait for the client before restoring a borrowed keycode ([#5172](https://github.com/helderperez-dev/reavion-driver/issues/5172)) ([7e6db51](https://github.com/helderperez-dev/reavion-driver/commit/7e6db51b078e6b7572b0927a47ef3372854d3eba))

## [0.35.4](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.35.3...reavion-driver-rs-v0.35.4) (2026-10-14)


### Bug Fixes

* **reavion-driver:** background browser clicks reach pointer-driven rows ([#5110](https://github.com/helderperez-dev/reavion-driver/issues/5110)) ([a7c4a0e](https://github.com/helderperez-dev/reavion-driver/commit/a7c4a0ea5e197fdfb422fa07a53649419296e842))
* **reavion-driver:** exit 64 for an unknown permissions subcommand ([#5148](https://github.com/helderperez-dev/reavion-driver/issues/5148)) ([63b3c9e](https://github.com/helderperez-dev/reavion-driver/commit/63b3c9efe7d207c62abbbe2f6504d1f6b42430a9))
* **reavion-driver:** fail type_text when a character cannot be typed ([#5139](https://github.com/helderperez-dev/reavion-driver/issues/5139)) ([2c3d2f4](https://github.com/helderperez-dev/reavion-driver/commit/2c3d2f412231b5ab41213c1972e985f4d079bbf7))
* **reavion-driver:** give each character of a text its own spare keycode ([#5158](https://github.com/helderperez-dev/reavion-driver/issues/5158)) ([f7e177f](https://github.com/helderperez-dev/reavion-driver/commit/f7e177fab66777faa7abba3576af4668c57add9c))
* **reavion-driver:** isolate Computer History under REAVION_DRIVER_RS_HOME ([#5165](https://github.com/helderperez-dev/reavion-driver/issues/5165)) ([fbab7c5](https://github.com/helderperez-dev/reavion-driver/commit/fbab7c506cf94d25dd76edda627e58a51b27b570))
* **reavion-driver:** keep background popups and context menus open on macOS ([#5129](https://github.com/helderperez-dev/reavion-driver/issues/5129)) ([2952665](https://github.com/helderperez-dev/reavion-driver/commit/295266586d25fcfea934eeb915ba8a701501d644))
* **reavion-driver:** keep list_windows valid when macOS reports non-finite window bounds ([#5125](https://github.com/helderperez-dev/reavion-driver/issues/5125)) ([e1091af](https://github.com/helderperez-dev/reavion-driver/commit/e1091afef672afdeb6fcf32aa18843aaf8c7ff52))
* **reavion-driver:** keep the Chromium screen rebase off a top-level frame that matches its window-manager frame ([#4967](https://github.com/helderperez-dev/reavion-driver/issues/4967)) ([6e050d7](https://github.com/helderperez-dev/reavion-driver/commit/6e050d72078b33959fbfece8e85bd1d4999a18d3))
* **reavion-driver:** preserve macOS middle-click window routing ([#5137](https://github.com/helderperez-dev/reavion-driver/issues/5137)) ([bf42be3](https://github.com/helderperez-dev/reavion-driver/commit/bf42be34f53ee5230f1dfa0ac38d37892592acfd))
* **reavion-driver:** preserve recording start timestamp in session.json ([#5145](https://github.com/helderperez-dev/reavion-driver/issues/5145)) ([d7d8ed8](https://github.com/helderperez-dev/reavion-driver/commit/d7d8ed8c690e93d691055f070b247371c84cbf60))
* **reavion-driver:** print the named command's help for `<command> --help` ([#5083](https://github.com/helderperez-dev/reavion-driver/issues/5083)) ([2a50b89](https://github.com/helderperez-dev/reavion-driver/commit/2a50b895eb055a13c778d0c8a041510ce1082dbc)), closes [#4708](https://github.com/helderperez-dev/reavion-driver/issues/4708)
* **reavion-driver:** refuse background Cmd+V when the browser focus is its omnibox ([#5124](https://github.com/helderperez-dev/reavion-driver/issues/5124)) ([c18bb1c](https://github.com/helderperez-dev/reavion-driver/commit/c18bb1c058ad09dc1beb0634a451c737049b000a))
* **reavion-driver:** share one approved Chrome connection across sessions ([#5115](https://github.com/helderperez-dev/reavion-driver/issues/5115)) ([a3a50cb](https://github.com/helderperez-dev/reavion-driver/commit/a3a50cbc4fe05848ac0f65f30a92ef6d97f197af))
* **reavion-driver:** stop opening a console window for the embedded daemon on Windows ([#5136](https://github.com/helderperez-dev/reavion-driver/issues/5136)) ([a9d9128](https://github.com/helderperez-dev/reavion-driver/commit/a9d912817b3021f330fc0734824373874f84038a))
* **reavion-driver:** wake Chromium AT-SPI content before the first application tree traversal ([#5074](https://github.com/helderperez-dev/reavion-driver/issues/5074)) ([e7af6a6](https://github.com/helderperez-dev/reavion-driver/commit/e7af6a61b0c297fd25a582c283ed55cfbece864b))
* **reavion-driver:** write action.json timestamp as ISO-8601 as documented ([#5144](https://github.com/helderperez-dev/reavion-driver/issues/5144)) ([a2a2d73](https://github.com/helderperez-dev/reavion-driver/commit/a2a2d7335f31f215ecac2cb33eeb96a90520fa4c))

## [0.35.3](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.35.2...reavion-driver-rs-v0.35.3) (2026-10-13)


### Bug Fixes

* **reavion-driver:** minimal agent cursor badge by default; cursor.badges verbose restores the old badge ([#5053](https://github.com/helderperez-dev/reavion-driver/issues/5053)) ([176d324](https://github.com/helderperez-dev/reavion-driver/commit/176d3243c796a285318485f625d2e5d76b0b7d05))
* **reavion-driver:** route browser pages to browser_prepare and refuse desktop pointer over background apps ([#5066](https://github.com/helderperez-dev/reavion-driver/issues/5066)) ([18da1bc](https://github.com/helderperez-dev/reavion-driver/commit/18da1bcbfe98e0837c130fa46b24d5473c7725e4))
* **reavion-driver:** SDK create() prefers the daemon on macOS so the agent cursor works ([#5090](https://github.com/helderperez-dev/reavion-driver/issues/5090)) ([1974dc3](https://github.com/helderperez-dev/reavion-driver/commit/1974dc39cb419c29b0e0689d6aefc7ef9dbc1c2a))
* **reavion-driver:** stop background actions from dropping a user keystroke on macOS ([#5091](https://github.com/helderperez-dev/reavion-driver/issues/5091)) ([c025ee7](https://github.com/helderperez-dev/reavion-driver/commit/c025ee7bf5c641cb02f8b13de6c8bf76c32a811f))
* **reavion-driver:** stop silent background failures in TextEdit and Finder on macOS ([#5057](https://github.com/helderperez-dev/reavion-driver/issues/5057)) ([3093808](https://github.com/helderperez-dev/reavion-driver/commit/3093808890193dd6430e5fe1a721c92e3e6c29ad))

## [0.35.2](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.35.1...reavion-driver-rs-v0.35.2) (2026-10-13)


### Bug Fixes

* **reavion-driver:** name the missing AT-SPI bus in the X11 background keyboard refusal ([#5070](https://github.com/helderperez-dev/reavion-driver/issues/5070)) ([d7c98c1](https://github.com/helderperez-dev/reavion-driver/commit/d7c98c1e0f661b1e0b1ca821a79b6a5ef45fbd2c))
* **reavion-driver:** scroll an inner Electron scroller in the background on macOS ([#5079](https://github.com/helderperez-dev/reavion-driver/issues/5079)) ([f72e033](https://github.com/helderperez-dev/reavion-driver/commit/f72e033269cd42c6e630cccd6496325b8b698248))
* **reavion-driver:** tolerate a transient UIA read and a twice-reported consent prompt on Windows ([#5082](https://github.com/helderperez-dev/reavion-driver/issues/5082)) ([f0c468f](https://github.com/helderperez-dev/reavion-driver/commit/f0c468f7b2b5875726a909b6d395204110777873))

## [0.35.1](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.35.0...reavion-driver-rs-v0.35.1) (2026-10-13)


### Features

* **reavion-driver:** attach to an existing Chrome profile in the background when Chrome is on another Space (macOS) ([#5052](https://github.com/helderperez-dev/reavion-driver/issues/5052)) ([10c5d3f](https://github.com/helderperez-dev/reavion-driver/commit/10c5d3f3d40f96009ac542fd3725b832b2ff7a36))


### Bug Fixes

* **reavion-driver:** pixel type_text, press_key and scroll in the background focus their target again on macOS ([#5062](https://github.com/helderperez-dev/reavion-driver/issues/5062)) ([d0a5093](https://github.com/helderperez-dev/reavion-driver/commit/d0a50933f0492993ebd6111ebb058712d7958080))
* **reavion-driver:** skip AT-SPI frame rebase when the frame has no extents ([#4984](https://github.com/helderperez-dev/reavion-driver/issues/4984)) ([7d8378f](https://github.com/helderperez-dev/reavion-driver/commit/7d8378f168264ac2b622870334f37f6589e07c24))
* **reavion-driver:** stop advertising pid as required for element_token tools ([#5047](https://github.com/helderperez-dev/reavion-driver/issues/5047)) ([a85f1be](https://github.com/helderperez-dev/reavion-driver/commit/a85f1be9cb787249118b3cfaac4a0935c6b21a6f))

## [0.35.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.34.0...reavion-driver-rs-v0.35.0) (2026-10-12)


### ⚠ BREAKING CHANGES

* **reavion-driver:** publish Vertex-compatible tool input schemas ([#4888](https://github.com/helderperez-dev/reavion-driver/issues/4888))
* **reavion-driver:** on macOS, a default get_window_state read no longer lists the items of closed menus: only the menu bar's titles appear, in `tree_markdown` and in `elements`. Run a menu item with `invoke_menu` and its path, or find it with `query`; `full_output: true` still walks every menu. On every platform, the walk diagnostics `nodes_visited`, `nodes_pending`, `walk_elapsed_ms` and `screenshot_refreshed_snapshot` now need `verbose: true`. Upgrade checklist: https://cua.ai/docs/reavion-driver/guides/operate#before-updating-to-035
* **reavion-driver:** on macOS, type_text sends `\n` and `\r` as the Return key and `\t` as the Tab key when it types keys (Chromium and Electron fields, `delivery_mode: "foreground"`, pixel targets); before, they went as Unicode text that apps mostly ignored. Text with a line break now submits a form or an address bar, and a tab moves focus: remove them from text that should not submit. Pid-only keyboard tools now act on the app's key window, and name it in the result, instead of refusing an ambiguous target. Upgrade checklist: https://cua.ai/docs/reavion-driver/guides/operate#before-updating-to-035
* **reavion-driver:** get_window_state no longer returns the structured `elements` array, `_note` or `background_input` by default, and caps the tree at 250 nodes. MCP and CLI callers that read `elements` or `_note` must pass `full_output: true` to keep the previous response, or ask for only the part they need: `tree_format: "elements"` (or `"both"`) for `elements`, `verbose: true` for `_note` and `background_input`, `max_elements` to lift the cap. The typed SDKs keep the full response unless a shape is requested.

### Features

* **reavion-driver:** add display_only to get_window_state for live previews ([#4881](https://github.com/helderperez-dev/reavion-driver/issues/4881)) ([4cbd096](https://github.com/helderperez-dev/reavion-driver/commit/4cbd0966c5054753c22c2800157709ad4d3ca3ce))
* **reavion-driver:** add run_actions batch tool (CUA-1194) ([#4737](https://github.com/helderperez-dev/reavion-driver/issues/4737)) ([a03d05b](https://github.com/helderperez-dev/reavion-driver/commit/a03d05b5f3c6a38de88893d9a5bc2b887aa85132))
* **reavion-driver:** background hover on macOS without the user's pointer: a window-target move_cursor reveals hover-only controls through AXShowAlternateUI, or hovers an Electron page through webContents.sendInputEvent (CUA-1342) ([e1ed4f4](https://github.com/helderperez-dev/reavion-driver/commit/e1ed4f41cdc0bf77dc7d7e8f828ae775c75bf834))
* **reavion-driver:** capture GNOME windows from their own actor (WinRects v10) ([#4882](https://github.com/helderperez-dev/reavion-driver/issues/4882)) ([78212ad](https://github.com/helderperez-dev/reavion-driver/commit/78212adace9539bca87e67fd2307c86c374ce79f))
* **reavion-driver:** get_window_state `since: <snapshot_id>` returns only the rows added, changed or removed since that snapshot, or `no change` (CUA-1193) ([#4743](https://github.com/helderperez-dev/reavion-driver/issues/4743)) ([45775a9](https://github.com/helderperez-dev/reavion-driver/commit/45775a9244df4a1e33090c1377eeb2448d2eb820))
* **reavion-driver:** get_window_state returns lean output by default: compact markdown only (no `elements`), at most 250 nodes unless `max_elements` is set, and no `_note` or `background_input` unless `verbose: true`; pass `full_output: true` for the previous full response; the typed SDKs keep the full response unless a shape is requested (CUA-1192) ([#4743](https://github.com/helderperez-dev/reavion-driver/issues/4743)) ([45775a9](https://github.com/helderperez-dev/reavion-driver/commit/45775a9244df4a1e33090c1377eeb2448d2eb820))
* **reavion-driver:** plan cursor motion with the new reavion-cursor-motion crate ([#4758](https://github.com/helderperez-dev/reavion-driver/issues/4758)) ([558cb53](https://github.com/helderperez-dev/reavion-driver/commit/558cb534d26ad51680ffd0f85b249bdebe64989a))
* **reavion-driver:** plan cursor motions from the SDKs through UniFFI ([#4767](https://github.com/helderperez-dev/reavion-driver/issues/4767)) ([365f5e3](https://github.com/helderperez-dev/reavion-driver/commit/365f5e3c5b92f9457dbd560ddea8ec0268565724))
* **reavion-driver:** rename run_actions to run_steps; run_actions stays a hidden alias until a future release ([#4935](https://github.com/helderperez-dev/reavion-driver/issues/4935)) ([d2b1491](https://github.com/helderperez-dev/reavion-driver/commit/d2b14913df638f59d37c6b59b6d85764d48d7b23))
* **reavion-driver:** run_actions steps that find, wait for and check by name ([#4820](https://github.com/helderperez-dev/reavion-driver/issues/4820)) ([ccaacd8](https://github.com/helderperez-dev/reavion-driver/commit/ccaacd8fda023f55a299689beefcc76389a617b1))
* **reavion-driver:** run_script is on by default on macOS, Windows and Linux: sandboxed JavaScript (QuickJS, driver-only `cua` API, time, call and memory limits) that drives the driver's own tools in one call, for loops, branches and retries; turn it off with `REAVION_DRIVER_DISABLE_RUN_SCRIPT=1` or `"disable_run_script": true` in `~/.reavion-driver/config.json` (`REAVION_DRIVER_EXPERIMENTAL_SCRIPT=0` still works; `=1` is no longer needed); `set_config` cannot change it (CUA-1214) ([#4936](https://github.com/helderperez-dev/reavion-driver/issues/4936)) ([815dfd9](https://github.com/helderperez-dev/reavion-driver/commit/815dfd96a10c83cb50c9151250a227d3d0ea4fc5))
* **reavion-driver:** run_script tool: sandboxed JavaScript (QuickJS) that drives the driver's own tools in one call, with wall-time, driver-call, heap and stack limits (on by default since [#4936](https://github.com/helderperez-dev/reavion-driver/issues/4936)) (CUA-1214) ([#4822](https://github.com/helderperez-dev/reavion-driver/issues/4822)) ([45469a5](https://github.com/helderperez-dev/reavion-driver/commit/45469a59c931ddccd78f9c18f1bbba4cb4cdd7be))
* **reavion-driver:** the agent cursor now defaults to `steady` timing: every move takes at least 600 ms with a gentle ease, so short moves no longer look like a snap; long moves keep their time. New selectable timings `relaxed` (450 ms floor), `calm` (750 ms floor) and `deliberate` (slower Fitts) join `native`, `fitts` and `fixed`; `reavion-driver config set cursor.motion.timing native` restores the previous timing. ([a70d776](https://github.com/helderperez-dev/reavion-driver/commit/a70d776b49e387658bcb574cf8482b5380ff3ece))


### Bug Fixes

* **reavion-driver:** accept common spellings of key names on macOS ([#4858](https://github.com/helderperez-dev/reavion-driver/issues/4858)) ([b7fef18](https://github.com/helderperez-dev/reavion-driver/commit/b7fef1824ac70e2a00487fab993bf92c2abdf0c1))
* **reavion-driver:** accept invoke_menu and zoom shapes models send, point named direct actions to run_actions ([#4862](https://github.com/helderperez-dev/reavion-driver/issues/4862)) ([7b3a8ee](https://github.com/helderperez-dev/reavion-driver/commit/7b3a8ee656a62a5d490e47c2dec1f534f2d53aca))
* **reavion-driver:** accept scroll dx/dy and handle get_window_state in run_actions ([#4831](https://github.com/helderperez-dev/reavion-driver/issues/4831)) ([5ac4ec7](https://github.com/helderperez-dev/reavion-driver/commit/5ac4ec763b04b8cc868ef143e404e66a6720533f))
* **reavion-driver:** activate browsers fully and keep the field focus before foreground typing ([#4835](https://github.com/helderperez-dev/reavion-driver/issues/4835)) ([c90e946](https://github.com/helderperez-dev/reavion-driver/commit/c90e94662e9980b1b575512a9da9ae8710e28f69))
* **reavion-driver:** background mouse events always carry explicit modifier flags on macOS ([#5051](https://github.com/helderperez-dev/reavion-driver/issues/5051)) ([f87f191](https://github.com/helderperez-dev/reavion-driver/commit/f87f1915270afe8b645036d698809f35cbe5721c))
* **reavion-driver:** break same-name ties by exact role and the acting tool in run_actions finds ([#4863](https://github.com/helderperez-dev/reavion-driver/issues/4863)) ([2ad9d62](https://github.com/helderperez-dev/reavion-driver/commit/2ad9d62a6634b6bb5bb9a7c8b8ecce11bb359770))
* **reavion-driver:** click on macOS refuses an unknown AX action name instead of pressing the element, and accepts show_alternate_ui / show_default_ui. Behaviour change ([e1ed4f4](https://github.com/helderperez-dev/reavion-driver/commit/e1ed4f41cdc0bf77dc7d7e8f828ae775c75bf834))
* **reavion-driver:** close the staging handle before removing it on Windows ([#4979](https://github.com/helderperez-dev/reavion-driver/issues/4979)) ([371848e](https://github.com/helderperez-dev/reavion-driver/commit/371848e8c41118fb8a0a27c5af0e892b8a980d85))
* **reavion-driver:** do not report a submitted type_text as partial delivery ([#4741](https://github.com/helderperez-dev/reavion-driver/issues/4741)) ([aa7a31a](https://github.com/helderperez-dev/reavion-driver/commit/aa7a31a5f3633249db69f766256b1749feb7a652))
* **reavion-driver:** document macOS trusted background limitation ([#4986](https://github.com/helderperez-dev/reavion-driver/issues/4986)) ([a130c4d](https://github.com/helderperez-dev/reavion-driver/commit/a130c4d48d8361c870c1423aae74ec5720f79fa9))
* **reavion-driver:** drop the foreground resend hint from delivered macOS hotkeys ([#4982](https://github.com/helderperez-dev/reavion-driver/issues/4982)) ([206c026](https://github.com/helderperez-dev/reavion-driver/commit/206c026490524af63c169410f4e4271dd27d394b))
* **reavion-driver:** exit 64 for reavion-driver extension usage errors ([#4959](https://github.com/helderperez-dev/reavion-driver/issues/4959)) ([c3cd340](https://github.com/helderperez-dev/reavion-driver/commit/c3cd340d7a8196a71c51664f0eadac80a9f5c36b))
* **reavion-driver:** ignore hidden helper windows and serialize foreground focus on macOS ([#4821](https://github.com/helderperez-dev/reavion-driver/issues/4821)) ([144ec6a](https://github.com/helderperez-dev/reavion-driver/commit/144ec6a41b23e4def7deffd56c23c511f80e18fa))
* **reavion-driver:** in-repo callers (Spaces permission approver, macOS image probe, cua-s1, Hyprland proofs, jev-use and samples) ask get_window_state for `elements` explicitly; the operate guide has a "Before updating to 0.35" checklist (https://cua.ai/docs/reavion-driver/guides/operate#before-updating-to-035) ([#4913](https://github.com/helderperez-dev/reavion-driver/issues/4913)) ([fbd031c](https://github.com/helderperez-dev/reavion-driver/commit/fbd031c0cd8c4750754cf3066190b9d4caad3783))
* **reavion-driver:** keep a failed run_actions report readable within client error limits ([#4897](https://github.com/helderperez-dev/reavion-driver/issues/4897)) ([5a364bb](https://github.com/helderperez-dev/reavion-driver/commit/5a364bbe60e1f8a901ceacd889606b6367dc96ab))
* **reavion-driver:** keep the user's key window during background work on macOS ([#4943](https://github.com/helderperez-dev/reavion-driver/issues/4943)) ([e321277](https://github.com/helderperez-dev/reavion-driver/commit/e321277644369e179798f07cfdad07499ded63e9))
* **reavion-driver:** let a get_window_state query search the whole window ([#4855](https://github.com/helderperez-dev/reavion-driver/issues/4855)) ([902934b](https://github.com/helderperez-dev/reavion-driver/commit/902934b6489d49257be6645db49f4989443db8fc))
* **reavion-driver:** let embedded hosts disable the daemon update check ([#4985](https://github.com/helderperez-dev/reavion-driver/issues/4985)) ([8af227e](https://github.com/helderperez-dev/reavion-driver/commit/8af227e42cedb6d2b7f227e0c3b508f9a5836ea7))
* **reavion-driver:** list the menu items when an invoke_menu segment is missing ([#4857](https://github.com/helderperez-dev/reavion-driver/issues/4857)) ([54656d6](https://github.com/helderperez-dev/reavion-driver/commit/54656d61fed6a0431ba356689ce6664e403c8e5e))
* **reavion-driver:** macOS reverts a background target's self-activation (Chrome on cmd+L, GnuCash on a double-click) within tens of milliseconds and gives the user's window key focus back; pixel double_click now goes through click. Behaviour change: the pixel double_click result reads "Posted double-click to pid …", and it needs a get_window_state screenshot of the window first, like click (CUA-1341) ([#4976](https://github.com/helderperez-dev/reavion-driver/issues/4976)) ([5458c77](https://github.com/helderperez-dev/reavion-driver/commit/5458c77b04a6e5e7a099929e0c4d4366e83dd403))
* **reavion-driver:** make run_actions take the shapes models send and recover from stale targets ([#4859](https://github.com/helderperez-dev/reavion-driver/issues/4859)) ([6e74bfa](https://github.com/helderperez-dev/reavion-driver/commit/6e74bfadd82790312f0ab46ae7ed48027f8aca56))
* **reavion-driver:** move macOS windows on another Space with set_window_frame ([#4636](https://github.com/helderperez-dev/reavion-driver/issues/4636)) ([7808a55](https://github.com/helderperez-dev/reavion-driver/commit/7808a55e90c60a8b57a63236ca3e677654408e9a))
* **reavion-driver:** move_cursor with a window target on macOS reads window screenshot pixels and moves only the agent cursor; a background app sees no hover, and the result says so. Behaviour change (CUA-1342) ([#4977](https://github.com/helderperez-dev/reavion-driver/issues/4977)) ([29823dd](https://github.com/helderperez-dev/reavion-driver/commit/29823dd6b556cb893cdc5fdbeb687eb18d1c8f54))
* **reavion-driver:** normalize Windows skill junction paths ([#4983](https://github.com/helderperez-dev/reavion-driver/issues/4983)) ([9579e56](https://github.com/helderperez-dev/reavion-driver/commit/9579e561613bbe7f7253fb561ae3ae4041c2cab3))
* **reavion-driver:** on Linux, set_value selects GTK combo-box options through AT-SPI Selection, closes any popup its keyboard fallback opens, and no longer fails that fallback with action_outcome_mismatch ([#4775](https://github.com/helderperez-dev/reavion-driver/issues/4775)) ([598f6de](https://github.com/helderperez-dev/reavion-driver/commit/598f6de7a78c291d7bbc8c8845c65f43b1fccbb0))
* **reavion-driver:** on macOS, accept element_token without pid and say what to do after refusals ([#4739](https://github.com/helderperez-dev/reavion-driver/issues/4739)) ([3931962](https://github.com/helderperez-dev/reavion-driver/commit/3931962cc76f7f1f62774da9ad87696f48e31a5e))
* **reavion-driver:** on macOS, set_value and type_text's accessibility write into a document's text area now also send a net-zero key edit (space, backspace) so the document registers the change and saves it; before, TextEdit kept the old content (Bench v2 DS-07). Behaviour change: one extra "Typing" undo step ([#4989](https://github.com/helderperez-dev/reavion-driver/issues/4989)) ([adadbe2](https://github.com/helderperez-dev/reavion-driver/commit/adadbe2f53b9227f95493d2a9a28a2911177001e))
* **reavion-driver:** on macOS, set_value selects options of AppKit and Chromium pop-up buttons ([#4740](https://github.com/helderperez-dev/reavion-driver/issues/4740)) ([8481162](https://github.com/helderperez-dev/reavion-driver/commit/848116252c5f3a1b6f5458e5454904b2780eb1f9))
* **reavion-driver:** on Windows and Linux, accept element_token without pid; a stale token is refused as stale_element_token ([#4773](https://github.com/helderperez-dev/reavion-driver/issues/4773)) ([12365b3](https://github.com/helderperez-dev/reavion-driver/commit/12365b36d41417cae34eb0f90b49e8eaf023ac51))
* **reavion-driver:** on Windows, set_value on a native combo box selects the option (or types into an editable one) so the app's change handlers run, and refuses an unknown option ([#4774](https://github.com/helderperez-dev/reavion-driver/issues/4774)) ([69ebe4b](https://github.com/helderperez-dev/reavion-driver/commit/69ebe4bfbac69778c1c03cdae1178f09f8144936))
* **reavion-driver:** one-turn route for background-refused batch steps and index-less name misses ([#4891](https://github.com/helderperez-dev/reavion-driver/issues/4891)) ([0188a55](https://github.com/helderperez-dev/reavion-driver/commit/0188a554de27774f62c3d3ba5c9e24a0618d41e2))
* **reavion-driver:** pace Windows foreground type_text one readable unit at a time ([#4901](https://github.com/helderperez-dev/reavion-driver/issues/4901)) ([e63171f](https://github.com/helderperez-dev/reavion-driver/commit/e63171fabe7df77c0dddef9ca0aaa309e62ec33d))
* **reavion-driver:** pass REAVION_DRIVER_RS_ENABLE_WAYLAND through to embedded hosts ([#4877](https://github.com/helderperez-dev/reavion-driver/issues/4877)) ([07cbc6c](https://github.com/helderperez-dev/reavion-driver/commit/07cbc6cd45abafaf12a554ab46bee09a1c0dc63b))
* **reavion-driver:** point a background-disabled invoke_menu refusal at the foreground shortcut ([#5055](https://github.com/helderperez-dev/reavion-driver/issues/5055)) ([eccbce9](https://github.com/helderperez-dev/reavion-driver/commit/eccbce9778b0cb472b93ba1918cdf9b5c6d7d627))
* **reavion-driver:** post a background right click once on macOS ([#4690](https://github.com/helderperez-dev/reavion-driver/issues/4690)) ([0b90b6f](https://github.com/helderperez-dev/reavion-driver/commit/0b90b6f4af6885ecbe696a6b33a3ad63773183d4))
* **reavion-driver:** post a mouse-moved event after a desktop pointer warp on macOS ([#4854](https://github.com/helderperez-dev/reavion-driver/issues/4854)) ([7de3dbc](https://github.com/helderperez-dev/reavion-driver/commit/7de3dbcfbd70bc923f170acbbe571ec5faa2f0ea))
* **reavion-driver:** prevent Linux accessibility-bus deadlocks ([#4903](https://github.com/helderperez-dev/reavion-driver/issues/4903)) ([e3ad831](https://github.com/helderperez-dev/reavion-driver/commit/e3ad8319a7742f8e346d52f492b4ba1278e9c2d1))
* **reavion-driver:** publish Vertex-compatible tool input schemas ([#4888](https://github.com/helderperez-dev/reavion-driver/issues/4888)) ([9f78f0e](https://github.com/helderperez-dev/reavion-driver/commit/9f78f0e4f598866f210f069e7e66b27a19c661f7))
* **reavion-driver:** put the user's window back above a background target that opens a menu on macOS ([#4955](https://github.com/helderperez-dev/reavion-driver/issues/4955)) ([984e5f9](https://github.com/helderperez-dev/reavion-driver/commit/984e5f9c5c5a39185e7d0e03f3d6937e44503c31))
* **reavion-driver:** reap finished daemon connection tasks ([#4980](https://github.com/helderperez-dev/reavion-driver/issues/4980)) ([e3b4012](https://github.com/helderperez-dev/reavion-driver/commit/e3b40126cdeb264e5b09e3b0e646ee30e687c098))
* **reavion-driver:** refuse background existing-profile attach on macOS instead of bringing Chrome forward ([#5007](https://github.com/helderperez-dev/reavion-driver/issues/5007)) ([e1a6396](https://github.com/helderperez-dev/reavion-driver/commit/e1a6396b42a0f0dae992a79560522aefbd53cf8c))
* **reavion-driver:** refuse background pixel clicks LibreOffice cannot receive ([#4864](https://github.com/helderperez-dev/reavion-driver/issues/4864)) ([49e924c](https://github.com/helderperez-dev/reavion-driver/commit/49e924c4632882134b204b2e8a0ce8fae44418df))
* **reavion-driver:** refuse background submits into a Chromium address bar ([#4856](https://github.com/helderperez-dev/reavion-driver/issues/4856)) ([3532ba5](https://github.com/helderperez-dev/reavion-driver/commit/3532ba53f9473f56be17d4c022b5cb69e4ef557e))
* **reavion-driver:** remove lean-read failure modes and make batching the default path ([#4812](https://github.com/helderperez-dev/reavion-driver/issues/4812)) ([b869593](https://github.com/helderperez-dev/reavion-driver/commit/b86959306a92dec1598f15df80249497e7ea3a85))
* **reavion-driver:** repair non-native Linux tool registry ([#4715](https://github.com/helderperez-dev/reavion-driver/issues/4715)) ([6f7ed59](https://github.com/helderperez-dev/reavion-driver/commit/6f7ed59138c36ff92370bda915dd99395c97b00a))
* **reavion-driver:** resolve latest release without the rate-limited REST API ([#4757](https://github.com/helderperez-dev/reavion-driver/issues/4757)) ([a2b3182](https://github.com/helderperez-dev/reavion-driver/commit/a2b3182eac9830d7935e8a459939ec9357a856b7)), closes [#4755](https://github.com/helderperez-dev/reavion-driver/issues/4755)
* **reavion-driver:** run menu-bar item tokens as invoke_menu and keep rows for stale-token re-finds ([#4886](https://github.com/helderperez-dev/reavion-driver/issues/4886)) ([4c2403f](https://github.com/helderperez-dev/reavion-driver/commit/4c2403fc557492cbd1e8018a0f2104cdcd6fd838))
* **reavion-driver:** say macOS list_apps omits unknown fields, and test it ([#4925](https://github.com/helderperez-dev/reavion-driver/issues/4925)) ([8cd4d2c](https://github.com/helderperez-dev/reavion-driver/commit/8cd4d2cac58b1590b7bcd463f07a6aafde391d5d))
* **reavion-driver:** say when a tooltip needs the app under the pointer active ([#4865](https://github.com/helderperez-dev/reavion-driver/issues/4865)) ([7dbead0](https://github.com/helderperez-dev/reavion-driver/commit/7dbead00a2ac914a7b118901d8dd9606a27eb076))
* **reavion-driver:** screenshot windows on another Space on macOS (CUA-1351) ([#4996](https://github.com/helderperez-dev/reavion-driver/issues/4996)) ([a1637f5](https://github.com/helderperez-dev/reavion-driver/commit/a1637f5e2d7ed156f4f74130484c3ea9140bec3f))
* **reavion-driver:** scroll Electron windows in the background through accessibility ([#4861](https://github.com/helderperez-dev/reavion-driver/issues/4861)) ([ea32762](https://github.com/helderperez-dev/reavion-driver/commit/ea32762c9207912eaa73622fda62835d9aef6206))
* **reavion-driver:** set_value on macOS fails with write_not_applied when the read-back shows the value did not move (LibreOffice Calc cells), instead of returning "Sent (unverified)". Behaviour change ([#4977](https://github.com/helderperez-dev/reavion-driver/issues/4977)) ([29823dd](https://github.com/helderperez-dev/reavion-driver/commit/29823dd6b556cb893cdc5fdbeb687eb18d1c8f54))
* **reavion-driver:** the macOS background drag refusal names non-drag routes first ([#4977](https://github.com/helderperez-dev/reavion-driver/issues/4977)) ([29823dd](https://github.com/helderperez-dev/reavion-driver/commit/29823dd6b556cb893cdc5fdbeb687eb18d1c8f54))
* **reavion-driver:** wait for EIS to acknowledge libei input before replying ([#4880](https://github.com/helderperez-dev/reavion-driver/issues/4880)) ([9487b0f](https://github.com/helderperez-dev/reavion-driver/commit/9487b0f895a278aa679153e667c5bc6231f792d6))
* **reavion-driver:** wait for the keymap restore before closing the connection ([#4981](https://github.com/helderperez-dev/reavion-driver/issues/4981)) ([160ac57](https://github.com/helderperez-dev/reavion-driver/commit/160ac57df22df948f4c2eaf42acc5c80a5dc2598))


### Performance Improvements

* **reavion-driver:** cap macOS screenshots at 1366 px by default, desktop captures included ([#4917](https://github.com/helderperez-dev/reavion-driver/issues/4917)) ([c4d0f62](https://github.com/helderperez-dev/reavion-driver/commit/c4d0f62557edcdc2be02b384b633b742fd155bd7))
* **reavion-driver:** filter list_windows by app and steer discovery away from host-wide lists ([#4916](https://github.com/helderperez-dev/reavion-driver/issues/4916)) ([5e638b2](https://github.com/helderperez-dev/reavion-driver/commit/5e638b2113f7105b93e0cccf4477e4080995f717))
* **reavion-driver:** front-load efficient workflow, trim hot tool descriptions (CUA-1195, CUA-1198) ([#4742](https://github.com/helderperez-dev/reavion-driver/issues/4742)) ([c076293](https://github.com/helderperez-dev/reavion-driver/commit/c0762938ba76b4f2f03472e01fe7da9025fb3673))
* **reavion-driver:** leaner window reads: collapse closed menus, drop noise rows and metadata ([#4892](https://github.com/helderperez-dev/reavion-driver/issues/4892)) ([c1c2b5f](https://github.com/helderperez-dev/reavion-driver/commit/c1c2b5fee428c3a39bebe5e77549c3d3525a608d))
* **reavion-driver:** return quiet actions after 300 ms instead of the full 1 s window watch ([#4915](https://github.com/helderperez-dev/reavion-driver/issues/4915)) ([fb83f98](https://github.com/helderperez-dev/reavion-driver/commit/fb83f9848cd52f49f3a3d5252d1af69ca0f5a442))
* **reavion-driver:** reuse one session-bus connection for the GNOME helper ([#4879](https://github.com/helderperez-dev/reavion-driver/issues/4879)) ([48cc491](https://github.com/helderperez-dev/reavion-driver/commit/48cc491463491c55287f86a552989e8c19e72583))

## [0.34.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.33.4...reavion-driver-rs-v0.34.0) (2026-10-05)


### Features

* **reavion-driver:** choose the cursor motion in start_session and a saved default ([#4670](https://github.com/helderperez-dev/reavion-driver/issues/4670)) ([75ac680](https://github.com/helderperez-dev/reavion-driver/commit/75ac6800d12d6de94320219a4d713436464efcb2))
* **reavion-driver:** six agent cursor motion styles ([#4659](https://github.com/helderperez-dev/reavion-driver/issues/4659)) ([5e5370f](https://github.com/helderperez-dev/reavion-driver/commit/5e5370f7c9a57e9540eadc17c19b5bfeca0d9d91))


### Bug Fixes

* **reavion-driver:** draw the comet trail from the arrow's body, not its tip ([#4673](https://github.com/helderperez-dev/reavion-driver/issues/4673)) ([9abf27b](https://github.com/helderperez-dev/reavion-driver/commit/9abf27b622e1cf544c95da4adc8b614ddf716313))
* **reavion-driver:** prefer the owned macOS browser profile endpoint ([#4384](https://github.com/helderperez-dev/reavion-driver/issues/4384)) ([9966c8b](https://github.com/helderperez-dev/reavion-driver/commit/9966c8bd805465f1897540b289df6e09f1506217))
* **reavion-driver:** scope macOS health permission guidance ([#4674](https://github.com/helderperez-dev/reavion-driver/issues/4674)) ([4addd86](https://github.com/helderperez-dev/reavion-driver/commit/4addd869b6a14b9f4d416de6e725adc7082c8eb7))
* **images:** keep Chromium tabs alive under gVisor on arm64 ([#4658](https://github.com/helderperez-dev/reavion-driver/issues/4658)) ([f68b806](https://github.com/helderperez-dev/reavion-driver/commit/f68b806024170205c63f4c65501a11e61042fa38))

## [0.33.4](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.33.3...reavion-driver-rs-v0.33.4) (2026-10-05)


### Bug Fixes

* **reavion-driver:** recognize captured Chinese browser consent ([#4590](https://github.com/helderperez-dev/reavion-driver/issues/4590)) ([9ccafc9](https://github.com/helderperez-dev/reavion-driver/commit/9ccafc981412b02c096fc5a4008d08b16cada8e7))
* **reavion-driver:** support multi-monitor Hyprland desktops ([#4305](https://github.com/helderperez-dev/reavion-driver/issues/4305)) ([8674a68](https://github.com/helderperez-dev/reavion-driver/commit/8674a6832086a38c40ea59886b977a82a97645ad))

## [0.33.3](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.33.2...reavion-driver-rs-v0.33.3) (2026-10-04)


### Bug Fixes

* **reavion-driver:** drain committed consent work through timeout ([26560e5](https://github.com/helderperez-dev/reavion-driver/commit/26560e5ccc6bb7c06864377794790094a4c3171a))
* **reavion-driver:** refuse set_value on Finder's Get Info Name field ([#4614](https://github.com/helderperez-dev/reavion-driver/issues/4614)) ([f8c292a](https://github.com/helderperez-dev/reavion-driver/commit/f8c292a95135d7c87d1f426bad3afa271a598f80)), closes [#4577](https://github.com/helderperez-dev/reavion-driver/issues/4577)
* **reavion-driver:** settle started browser consent before claim completion ([d2d8d26](https://github.com/helderperez-dev/reavion-driver/commit/d2d8d263a924f425e835a1eeb5a7c0c6d9183d95))

## [0.33.2](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.33.1...reavion-driver-rs-v0.33.2) (2026-10-04)


### Bug Fixes

* **reavion-driver:** match "..." to the ellipsis in macOS menu paths ([#4578](https://github.com/helderperez-dev/reavion-driver/issues/4578)) ([a207d40](https://github.com/helderperez-dev/reavion-driver/commit/a207d402d0c645db5e71bde91c99ee10b8c9c8dc))
* **reavion-driver:** repair native Hyprland foreground regressions ([#4396](https://github.com/helderperez-dev/reavion-driver/issues/4396)) ([51003ab](https://github.com/helderperez-dev/reavion-driver/commit/51003ab368f35c429dd9301975fb59e1ef80d72e))

## [0.33.1](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.33.0...reavion-driver-rs-v0.33.1) (2026-10-03)


### Bug Fixes

* **reavion-driver:** close remaining Claude cleanup safety gaps ([eb13682](https://github.com/helderperez-dev/reavion-driver/commit/eb136826b46adb68209ef72881bb469fad23c660))
* **reavion-driver:** drain Windows foreground input before restoring focus ([#4500](https://github.com/helderperez-dev/reavion-driver/issues/4500)) ([c8edda0](https://github.com/helderperez-dev/reavion-driver/commit/c8edda06be53e13a759c69de125ce37189023954)), closes [#4477](https://github.com/helderperez-dev/reavion-driver/issues/4477)
* **reavion-driver:** fail safely when Claude ownership cannot be inspected ([f7ff44a](https://github.com/helderperez-dev/reavion-driver/commit/f7ff44aba1e8807e82860cd90825f4c77fa3e6c1))
* **reavion-driver:** keep idle X11 cursor overlays unmapped ([#4529](https://github.com/helderperez-dev/reavion-driver/issues/4529)) ([5e13eb7](https://github.com/helderperez-dev/reavion-driver/commit/5e13eb7777172587fa32ce2af1d78d7572b77f1a))
* **reavion-driver:** keep the CLI fallback inside the ownership check ([762c223](https://github.com/helderperez-dev/reavion-driver/commit/762c223918d8bbfa11cce77320810e0c7ddb670d))
* **reavion-driver:** keep the uninstaller parseable by bash 3.2 ([25c6cb1](https://github.com/helderperez-dev/reavion-driver/commit/25c6cb16eb9a2a4e35c25199bc358247185d3d6d))
* **reavion-driver:** let verify_state read label-less display text on macOS ([#4531](https://github.com/helderperez-dev/reavion-driver/issues/4531)) ([15c6c24](https://github.com/helderperez-dev/reavion-driver/commit/15c6c24e23184f8e0388440ec52f3e4ee2fb58f3)), closes [#4526](https://github.com/helderperez-dev/reavion-driver/issues/4526)
* **reavion-driver:** make Claude MCP cleanup path-owned ([cf31fc1](https://github.com/helderperez-dev/reavion-driver/commit/cf31fc1e0a616b8237337f4f363d591208fd8515))
* **reavion-driver:** make the macOS background drag refusal explicit ([#4533](https://github.com/helderperez-dev/reavion-driver/issues/4533)) ([61ec8ac](https://github.com/helderperez-dev/reavion-driver/commit/61ec8ac1d80df191bccd7fc9e9275123a809b2f7)), closes [#4524](https://github.com/helderperez-dev/reavion-driver/issues/4524)
* **reavion-driver:** make Windows MCP removal guidance ownership-safe ([4b2589c](https://github.com/helderperez-dev/reavion-driver/commit/4b2589cd87c3f139e55ef9b8e86a00654a6b3ba2))
* **reavion-driver:** omit AX-less AppKit helper windows from macOS list_windows ([#4534](https://github.com/helderperez-dev/reavion-driver/issues/4534)) ([4635c06](https://github.com/helderperez-dev/reavion-driver/commit/4635c066808ba662c1d82a394592f707b4ad09ae)), closes [#4525](https://github.com/helderperez-dev/reavion-driver/issues/4525)
* **reavion-driver:** preserve foreign dangling launcher ([c1800a0](https://github.com/helderperez-dev/reavion-driver/commit/c1800a06618a338eca0d2e1d136b67e40d258f8e))
* **reavion-driver:** reject relative MCP commands as ownership evidence ([abc786c](https://github.com/helderperez-dev/reavion-driver/commit/abc786ca428222ef1e429f3a9e255a9953cb841c))
* **reavion-driver:** remove UTF-8 BOM from Windows uninstaller ([e309dc1](https://github.com/helderperez-dev/reavion-driver/commit/e309dc15e8c92a4e7adbfce0aaa2aee5f1582540))
* **reavion-driver:** scrub the Claude MCP registration the CLI actually creates ([558ddf0](https://github.com/helderperez-dev/reavion-driver/commit/558ddf0141c952337e0f4d3c2455474ce28e3adb))
* **reavion-driver:** tie Claude MCP cleanup to actual release removal ([ff770f5](https://github.com/helderperez-dev/reavion-driver/commit/ff770f5d5211a5a5898a5a569cb84e4736000777))

## [0.33.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.32.0...reavion-driver-rs-v0.33.0) (2026-10-03)


### Features

* **reavion-driver:** auto-link skills for Pi ([#4049](https://github.com/helderperez-dev/reavion-driver/issues/4049)) ([402c6bd](https://github.com/helderperez-dev/reavion-driver/commit/402c6bd53bc2edee0555c5cd006d672a853c3d8e))
* **reavion-driver:** let embedding hosts set the macOS key gap ([#3489](https://github.com/helderperez-dev/reavion-driver/issues/3489)) ([310cdfd](https://github.com/helderperez-dev/reavion-driver/commit/310cdfd589631bba98444d1e4e77ed03269e0d80))


### Bug Fixes

* **reavion-driver:** accept verbatim and junctioned Windows browser installs ([#4467](https://github.com/helderperez-dev/reavion-driver/issues/4467)) ([07f2bfc](https://github.com/helderperez-dev/reavion-driver/commit/07f2bfce90396b85fc49711a82266a981b8fc317)), closes [#4345](https://github.com/helderperez-dev/reavion-driver/issues/4345)
* **reavion-driver:** close the menu a failed macOS invoke_menu path opened ([#4484](https://github.com/helderperez-dev/reavion-driver/issues/4484)) ([154ca56](https://github.com/helderperez-dev/reavion-driver/commit/154ca5690350217f0824e004d04c031e5c411883))
* **reavion-driver:** constrain element_token tool schemas ([#4318](https://github.com/helderperez-dev/reavion-driver/issues/4318)) ([db55739](https://github.com/helderperez-dev/reavion-driver/commit/db55739146476d2a5f6b34c8ccde4da6eab1dc3a))
* **reavion-driver:** count an erroring macOS toggle press when its value moved ([#4485](https://github.com/helderperez-dev/reavion-driver/issues/4485)) ([ca59dc0](https://github.com/helderperez-dev/reavion-driver/commit/ca59dc0f15ace9c7c643042163bfd9086c88d9e8)), closes [#3835](https://github.com/helderperez-dev/reavion-driver/issues/3835)
* **reavion-driver:** deduplicate macOS browser setup identities ([#4466](https://github.com/helderperez-dev/reavion-driver/issues/4466)) ([51b9255](https://github.com/helderperez-dev/reavion-driver/commit/51b925522e2e811edb2d13a51a92780a5a0e12ac))
* **reavion-driver:** extend first Linux snapshot budget ([#4375](https://github.com/helderperez-dev/reavion-driver/issues/4375)) ([920a42f](https://github.com/helderperez-dev/reavion-driver/commit/920a42f1043a04400924f797d5430543a0ff99ad))
* **reavion-driver:** map Windows browser window rect into Chromium DIP layout ([#4506](https://github.com/helderperez-dev/reavion-driver/issues/4506)) ([1974811](https://github.com/helderperez-dev/reavion-driver/commit/197481193955970de22857caaaaa87c146a0373c)), closes [#4428](https://github.com/helderperez-dev/reavion-driver/issues/4428)
* **reavion-driver:** point the macOS CDP-port error at browser_prepare, not launch_app flags ([#2931](https://github.com/helderperez-dev/reavion-driver/issues/2931)) ([f0447fa](https://github.com/helderperez-dev/reavion-driver/commit/f0447fad70e1b151bcc8226f3889236cf1135cae))
* **reavion-driver:** rank titled macOS launch windows first ([#4048](https://github.com/helderperez-dev/reavion-driver/issues/4048)) ([b02ed97](https://github.com/helderperez-dev/reavion-driver/commit/b02ed97a76774faa2be269663877a6816f25c3b6))
* **reavion-driver:** re-resolve visible windows on a stale Space view ([#4509](https://github.com/helderperez-dev/reavion-driver/issues/4509)) ([f105145](https://github.com/helderperez-dev/reavion-driver/commit/f105145fab23968262e4ec82934a15de814317b8)), closes [#4437](https://github.com/helderperez-dev/reavion-driver/issues/4437)
* **reavion-driver:** refuse ambiguous macOS browser AppleScript ([#4051](https://github.com/helderperez-dev/reavion-driver/issues/4051)) ([fb33104](https://github.com/helderperez-dev/reavion-driver/commit/fb33104d2e7468a9210425479d9c942565fbbbe8))
* **reavion-driver:** refuse set_value on Finder file name cells instead of confirming a rename that never happened ([#4483](https://github.com/helderperez-dev/reavion-driver/issues/4483)) ([323af7c](https://github.com/helderperez-dev/reavion-driver/commit/323af7c39876a4464ad6c4ce2acf1cf17b049921)), closes [#4469](https://github.com/helderperez-dev/reavion-driver/issues/4469)
* **reavion-driver:** report recoverable UIA timeouts as warnings ([#3959](https://github.com/helderperez-dev/reavion-driver/issues/3959)) ([59c1f4b](https://github.com/helderperez-dev/reavion-driver/commit/59c1f4ba2fa6b6c868a1331f8e7df6d7ee94790c))
* **reavion-driver:** resolve sheet elements to their parent window ([#4507](https://github.com/helderperez-dev/reavion-driver/issues/4507)) ([030d5a0](https://github.com/helderperez-dev/reavion-driver/commit/030d5a0c05e0ce0684a051452c7b1ff618de66cd)), closes [#4392](https://github.com/helderperez-dev/reavion-driver/issues/4392)
* **reavion-driver:** support rotated Hyprland outputs ([#3969](https://github.com/helderperez-dev/reavion-driver/issues/3969)) ([69cf20a](https://github.com/helderperez-dev/reavion-driver/commit/69cf20a32d3a660bad9a3f7e3e99ab13fbca86f7))
* **reavion-driver:** validate get_window_state window via exact Win32 lookup ([#4505](https://github.com/helderperez-dev/reavion-driver/issues/4505)) ([fc6b4be](https://github.com/helderperez-dev/reavion-driver/commit/fc6b4beaa5345dc318f4f17e9a6be4b9188b5bb2)), closes [#4416](https://github.com/helderperez-dev/reavion-driver/issues/4416)
* **reavion-driver:** validate Windows capture handles ([#4333](https://github.com/helderperez-dev/reavion-driver/issues/4333)) ([0293791](https://github.com/helderperez-dev/reavion-driver/commit/029379139cf976de40f325ee4db94972bc2f74a0))

## [0.32.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.31.0...reavion-driver-rs-v0.32.0) (2026-10-01)


### Features

* merge updated sdk from cua-staging ([#4397](https://github.com/helderperez-dev/reavion-driver/issues/4397)) ([9166817](https://github.com/helderperez-dev/reavion-driver/commit/9166817485ae53f3966935c13878a8196d79a399))


### Bug Fixes

* **reavion-driver:** list #4418 and #4421 in the 0.32.0 changelog ([#4425](https://github.com/helderperez-dev/reavion-driver/issues/4425))
* **reavion-driver:** list every windowed instance of a bundle in macOS list_apps ([#4421](https://github.com/helderperez-dev/reavion-driver/issues/4421)) ([29c5465](https://github.com/helderperez-dev/reavion-driver/commit/29c54656ccf6bf8490461768a0fac3096eb91e5c))
* **installers:** hash downloads with .NET and load Windows PowerShell's own modules, so update --apply works from pwsh 7 ([#4418](https://github.com/helderperez-dev/reavion-driver/issues/4418)) ([a22426a](https://github.com/helderperez-dev/reavion-driver/commit/a22426adac1980dae7a44dde2f6446a8da39b99c))
* **reavion-driver:** keep Windows update --apply from killing its own installer ([#4398](https://github.com/helderperez-dev/reavion-driver/issues/4398)) ([93d0f7a](https://github.com/helderperez-dev/reavion-driver/commit/93d0f7af24b1561f98f6a85cd20ca2b35f37db35))
* **reavion-driver:** run the cursor event loop when PiP is enabled ([#4304](https://github.com/helderperez-dev/reavion-driver/issues/4304)) ([5933507](https://github.com/helderperez-dev/reavion-driver/commit/5933507e73be299f0d7d7e4d7a600950da7b09e3))

## [0.31.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.30.4...reavion-driver-rs-v0.31.0) (2026-09-29)


### ⚠ BREAKING CHANGES

* **reavion-driver:** resolve element tokens against a snapshot store invalidated on read ([#3873](https://github.com/helderperez-dev/reavion-driver/issues/3873))

### Bug Fixes

* **reavion-driver:** accept every Enter-key spelling in the Linux terminal gate ([#3658](https://github.com/helderperez-dev/reavion-driver/issues/3658)) ([f1d8388](https://github.com/helderperez-dev/reavion-driver/commit/f1d8388714bb300da9f01775154a7d064ccead3e))
* **reavion-driver:** allow Hyprland foreground typing with Num Lock and keymap options ([#3970](https://github.com/helderperez-dev/reavion-driver/issues/3970)) ([7954a1c](https://github.com/helderperez-dev/reavion-driver/commit/7954a1c089b386e15aa22d30cf004c7b175ccae1))
* **reavion-driver:** honor modifiers during X11 drags ([#3618](https://github.com/helderperez-dev/reavion-driver/issues/3618)) ([8157888](https://github.com/helderperez-dev/reavion-driver/commit/815788869898c2df14d102802899f0cf51b04631))
* **reavion-driver:** keep the Windows autostart task when an isolated install or failed registration would remove it ([#4284](https://github.com/helderperez-dev/reavion-driver/issues/4284)) ([f7469d3](https://github.com/helderperez-dev/reavion-driver/commit/f7469d3fd6bd18c572d599f8f79bcf0b6c0060a4))
* **reavion-driver:** report live running state for accessory apps ([#3456](https://github.com/helderperez-dev/reavion-driver/issues/3456)) ([0d61146](https://github.com/helderperez-dev/reavion-driver/commit/0d61146a4c6be5ed3c4b2f47e5628fbe96560eca))
* **reavion-driver:** report native Wayland modified-drag refusals with a stable code ([#4360](https://github.com/helderperez-dev/reavion-driver/issues/4360)) ([62cdfbc](https://github.com/helderperez-dev/reavion-driver/commit/62cdfbcd9356cf2e1b47ab09fee94eddd1d881cc))
* **reavion-driver:** resolve element tokens against a snapshot store invalidated on read ([#3873](https://github.com/helderperez-dev/reavion-driver/issues/3873)) ([61f1c0a](https://github.com/helderperez-dev/reavion-driver/commit/61f1c0ab255a1a39e675d93341cd50c0ceb2027e))
* **reavion-driver:** reveal the agent cursor for keyboard-first actions ([#4287](https://github.com/helderperez-dev/reavion-driver/issues/4287)) ([2d0431f](https://github.com/helderperez-dev/reavion-driver/commit/2d0431fb00962c50349ca1a25247e8b502db679b))
* **reavion-driver:** send a real key repeat rate on Hyprland agent keyboards ([#4358](https://github.com/helderperez-dev/reavion-driver/issues/4358)) ([065a660](https://github.com/helderperez-dev/reavion-driver/commit/065a660f21fdd315928cd7afedfbb9d778f6eb65)), closes [#4257](https://github.com/helderperez-dev/reavion-driver/issues/4257)
* **reavion-driver:** ship the Hyprland plugin keyboard sources in release kits and test them in CI ([#4310](https://github.com/helderperez-dev/reavion-driver/issues/4310)) ([0e7ad50](https://github.com/helderperez-dev/reavion-driver/commit/0e7ad50a5796846a10d9b1c53ce2d29591027d8b))
* **reavion-driver:** wait for a launching macOS app before its first snapshot ([#4309](https://github.com/helderperez-dev/reavion-driver/issues/4309)) ([1cb7b6f](https://github.com/helderperez-dev/reavion-driver/commit/1cb7b6fb2415b6d12978d2dfa3ecda0b07075c72))

## [0.30.4](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.30.3...reavion-driver-rs-v0.30.4) (2026-09-28)


### Bug Fixes

* **reavion-driver:** anchor theme transforms at hotspot ([#4246](https://github.com/helderperez-dev/reavion-driver/issues/4246)) ([b0ebd91](https://github.com/helderperez-dev/reavion-driver/commit/b0ebd915daf85beeb8e3301a2ae83df8d4499752))
* **reavion-driver:** capture X11 DirectColor window colors ([#3758](https://github.com/helderperez-dev/reavion-driver/issues/3758)) ([0dd44d6](https://github.com/helderperez-dev/reavion-driver/commit/0dd44d62226fe09dd2ee1a5bf0952d4572077b83))
* **reavion-driver:** drop schemars uint/float formats from contract schema ([#3462](https://github.com/helderperez-dev/reavion-driver/issues/3462)) ([efd75df](https://github.com/helderperez-dev/reavion-driver/commit/efd75df76f2ccdc2f9c63ca8fb65e0356a46a1b4))
* **reavion-driver:** keep a foreground key chord's modifiers on its base key ([#3855](https://github.com/helderperez-dev/reavion-driver/issues/3855)) ([f71044a](https://github.com/helderperez-dev/reavion-driver/commit/f71044a940b8eb5c604e461157bd9e64adefcf5a)), closes [#3849](https://github.com/helderperez-dev/reavion-driver/issues/3849)
* **reavion-driver:** preserve delivered X11 mouse click timing ([#3762](https://github.com/helderperez-dev/reavion-driver/issues/3762)) ([1db9aca](https://github.com/helderperez-dev/reavion-driver/commit/1db9aca009b79f9462e28949ef68e07487d9a118))
* **reavion-driver:** render browser cursor on Linux ([#3778](https://github.com/helderperez-dev/reavion-driver/issues/3778)) ([b75b0b0](https://github.com/helderperez-dev/reavion-driver/commit/b75b0b08c947e7d9b2a400e33694566771f9910d))
* **reavion-driver:** scope trajectory recording to the session that started it ([#3632](https://github.com/helderperez-dev/reavion-driver/issues/3632)) ([758488e](https://github.com/helderperez-dev/reavion-driver/commit/758488e582b7e48a396b44416135b45d2769fdfc))
* **reavion-driver:** support fractionally scaled Hyprland desktops ([#4244](https://github.com/helderperez-dev/reavion-driver/issues/4244)) ([3034435](https://github.com/helderperez-dev/reavion-driver/commit/3034435724d4621679f9e99f4dc0d348d6a684ef))
* **reavion-driver:** verify a raised window on its display, not global order ([#3785](https://github.com/helderperez-dev/reavion-driver/issues/3785)) ([0a91a11](https://github.com/helderperez-dev/reavion-driver/commit/0a91a118675bf8d7c36f43e096275952c2225770))

## [0.30.3](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.30.2...reavion-driver-rs-v0.30.3) (2026-09-28)


### Bug Fixes

* **reavion-driver:** confirm X11 foreground actions that close a window when focus parks on the WM ([#4248](https://github.com/helderperez-dev/reavion-driver/issues/4248)) ([55c7f27](https://github.com/helderperez-dev/reavion-driver/commit/55c7f27b19e8c688cb45911425edee798f77fb28))
* **reavion-driver:** diagnose file-descriptor exhaustion during macOS browser inspection ([#3889](https://github.com/helderperez-dev/reavion-driver/issues/3889)) ([da9af53](https://github.com/helderperez-dev/reavion-driver/commit/da9af5392ead4f04c2743cf6119c638cb81194f6))
* **reavion-driver:** diagnose Windows SSH pipe access ([#3318](https://github.com/helderperez-dev/reavion-driver/issues/3318)) ([92db289](https://github.com/helderperez-dev/reavion-driver/commit/92db2899a9dfe2ef44fe5fdfb38cf3ac67cd4deb))
* **reavion-driver:** drop the boolean enum from verify_state for Gemini clients ([#4229](https://github.com/helderperez-dev/reavion-driver/issues/4229)) ([919f1d5](https://github.com/helderperez-dev/reavion-driver/commit/919f1d517b504115af79e81b1a0c892cca4132c8))
* **reavion-driver:** fail autostart enable when the UAC prompt is declined ([#3180](https://github.com/helderperez-dev/reavion-driver/issues/3180)) ([cb74f56](https://github.com/helderperez-dev/reavion-driver/commit/cb74f56d76b8371d41aeccb0d764ab570237459a))
* **reavion-driver:** handle consent for fresh browser claims ([#3288](https://github.com/helderperez-dev/reavion-driver/issues/3288)) ([a00aec2](https://github.com/helderperez-dev/reavion-driver/commit/a00aec22cf96a86c27599ed829e5ac2a7022f491))
* **reavion-driver:** ignore daemon windows in change detection ([#1784](https://github.com/helderperez-dev/reavion-driver/issues/1784)) ([dee3d52](https://github.com/helderperez-dev/reavion-driver/commit/dee3d5225cf85ba94f67f4190d7d381dcf31abb7))
* **reavion-driver:** invoke a menu on a window that is not already in front ([#3781](https://github.com/helderperez-dev/reavion-driver/issues/3781)) ([8ec1de4](https://github.com/helderperez-dev/reavion-driver/commit/8ec1de4761690c164a598a990625ac3711493820))
* **reavion-driver:** keep schema properties named title or description ([#3827](https://github.com/helderperez-dev/reavion-driver/issues/3827)) ([1052ad8](https://github.com/helderperez-dev/reavion-driver/commit/1052ad8fe9497d817ff8ee947cdec636382559af)), closes [#3802](https://github.com/helderperez-dev/reavion-driver/issues/3802)
* **reavion-driver:** keep the Windows daemon accepting after a failed pipe instance ([#4279](https://github.com/helderperez-dev/reavion-driver/issues/4279)) ([49b7fb3](https://github.com/helderperez-dev/reavion-driver/commit/49b7fb324bd1b811d7c1b2b235977d6a6d52d0ae))
* **reavion-driver:** launch apps with a standard-user token from an elevated Windows Driver ([#4282](https://github.com/helderperez-dev/reavion-driver/issues/4282)) ([002b936](https://github.com/helderperez-dev/reavion-driver/commit/002b9365557667c5e999c77a438e329e5accfcb2)), closes [#3607](https://github.com/helderperez-dev/reavion-driver/issues/3607)
* **reavion-driver:** lazily initialize macos clipboard ([#3025](https://github.com/helderperez-dev/reavion-driver/issues/3025)) ([c3687bd](https://github.com/helderperez-dev/reavion-driver/commit/c3687bd8dffb90bcdd1670470e50eeb11db5d106))
* **reavion-driver:** let SDK hosts bound the post-action window poll ([#3946](https://github.com/helderperez-dev/reavion-driver/issues/3946)) ([990a2d1](https://github.com/helderperez-dev/reavion-driver/commit/990a2d1f17b27129bb05e9cebc68e4f5ebc0305b))
* **reavion-driver:** make Windows listener discovery locale independent ([#3275](https://github.com/helderperez-dev/reavion-driver/issues/3275)) ([ed00ede](https://github.com/helderperez-dev/reavion-driver/commit/ed00ede10ec65fd605812959347399ae7cee3c6a))
* **reavion-driver:** map standalone Wayland modifier keys ([#3659](https://github.com/helderperez-dev/reavion-driver/issues/3659)) ([b1bd49c](https://github.com/helderperez-dev/reavion-driver/commit/b1bd49ce1dccb6fa5cdff1306f3e63e4b3163cbf))
* **reavion-driver:** mark the left Windows key as extended ([#4046](https://github.com/helderperez-dev/reavion-driver/issues/4046)) ([e955fb1](https://github.com/helderperez-dev/reavion-driver/commit/e955fb1b52dcfb924043eb4a38c656b24cc10840))
* **reavion-driver:** move fixed-size macOS windows with set_window_frame ([#4133](https://github.com/helderperez-dev/reavion-driver/issues/4133)) ([770bf22](https://github.com/helderperez-dev/reavion-driver/commit/770bf22db4cce624a512357eaa992ea23dfea32b)), closes [#4114](https://github.com/helderperez-dev/reavion-driver/issues/4114)
* **reavion-driver:** parse Windows signer names that contain commas ([#4273](https://github.com/helderperez-dev/reavion-driver/issues/4273)) ([160ae91](https://github.com/helderperez-dev/reavion-driver/commit/160ae91fc1f1d25583c79d7c0f51d2c4638b53a7)), closes [#4272](https://github.com/helderperez-dev/reavion-driver/issues/4272)
* **reavion-driver:** recreate an idle-reclaimed unnamed session on its next call ([#4283](https://github.com/helderperez-dev/reavion-driver/issues/4283)) ([b0842f5](https://github.com/helderperez-dev/reavion-driver/commit/b0842f52665516db8f364af3c3bc51b4172e6afc))
* **reavion-driver:** reject malformed tool arguments found by fuzzing ([#3777](https://github.com/helderperez-dev/reavion-driver/issues/3777)) ([38f56e4](https://github.com/helderperez-dev/reavion-driver/commit/38f56e4ae5c08e91a8d46f855f972e4ab5638a8e))
* **reavion-driver:** report Linux kill_app success only after the process exits ([#4281](https://github.com/helderperez-dev/reavion-driver/issues/4281)) ([3470e23](https://github.com/helderperez-dev/reavion-driver/commit/3470e230a1f17ba3cf4d55721ad8a32a0e68faf0))
* **reavion-driver:** report named Linux text fields' content as value ([#4292](https://github.com/helderperez-dev/reavion-driver/issues/4292)) ([7224b85](https://github.com/helderperez-dev/reavion-driver/commit/7224b85f62badb32a923e6ba655453072771ae87))
* **reavion-driver:** report screenshot_frame_valid on successful Linux window captures ([#3814](https://github.com/helderperez-dev/reavion-driver/issues/3814)) ([9fe9520](https://github.com/helderperez-dev/reavion-driver/commit/9fe9520ef35775b1d056d7a2cc2be302ee5ac75c))
* **reavion-driver:** resolve Windows shortcut environment targets ([#3975](https://github.com/helderperez-dev/reavion-driver/issues/3975)) ([1b58f46](https://github.com/helderperez-dev/reavion-driver/commit/1b58f4688e1b550ddf6950924c2e1ce70276ebe4))
* **reavion-driver:** scope codesign --strict to symlinks in isolated-launch check ([#4059](https://github.com/helderperez-dev/reavion-driver/issues/4059)) ([d4585e8](https://github.com/helderperez-dev/reavion-driver/commit/d4585e86524192ffb5a69fd8f2e23bda98bd6dff))
* **reavion-driver:** self-elevate the Windows local uninstaller ([#3178](https://github.com/helderperez-dev/reavion-driver/issues/3178)) ([09ffe7b](https://github.com/helderperez-dev/reavion-driver/commit/09ffe7b0df2316ed52da9b16e5990204f09ab245))
* **reavion-driver:** skip Chromium targets without browser windows ([#3541](https://github.com/helderperez-dev/reavion-driver/issues/3541)) ([8381a05](https://github.com/helderperez-dev/reavion-driver/commit/8381a051072834a6a960571455ccfcc33bc143ae))
* **reavion-driver:** skip unrepresentable Hyprland clients ([#4250](https://github.com/helderperez-dev/reavion-driver/issues/4250)) ([fbbb2d7](https://github.com/helderperez-dev/reavion-driver/commit/fbbb2d706bed5421f0761c61db8876e290fa5d86))
* **reavion-driver:** wait for a cold Chromium tree before the first snapshot ([#3783](https://github.com/helderperez-dev/reavion-driver/issues/3783)) ([1e93424](https://github.com/helderperez-dev/reavion-driver/commit/1e93424e55fb28252f2112e2c683bdbb35cbda11))


### Performance Improvements

* **reavion-driver:** skip verifier AX walk for screenshot evidence ([#4164](https://github.com/helderperez-dev/reavion-driver/issues/4164)) ([78c42a3](https://github.com/helderperez-dev/reavion-driver/commit/78c42a38ab27e61ca74d5ea53362f23eac8ef921))

## [0.30.2](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.30.1...reavion-driver-rs-v0.30.2) (2026-09-27)


### Bug Fixes

* **reavion-driver:** refresh the semantic page title after navigation ([#4261](https://github.com/helderperez-dev/reavion-driver/issues/4261)) ([9d24562](https://github.com/helderperez-dev/reavion-driver/commit/9d2456213f643817e414f5f97a9a76d1f5c73c56)), closes [#2959](https://github.com/helderperez-dev/reavion-driver/issues/2959) [#3577](https://github.com/helderperez-dev/reavion-driver/issues/3577)

## [0.30.1](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.30.0...reavion-driver-rs-v0.30.1) (2026-09-26)


### Bug Fixes

* **reavion-driver:** keep the agent cursor out of desktop captures ([#4199](https://github.com/helderperez-dev/reavion-driver/issues/4199)) ([fa5ded7](https://github.com/helderperez-dev/reavion-driver/commit/fa5ded76dc407af1c8a41413a0e556142135fddb)), closes [#4194](https://github.com/helderperez-dev/reavion-driver/issues/4194). This change is also contained in the `reavion-driver-rs-v0.30.0` tag, whose release was never published.
* **reavion-driver:** launch isolated browsers de-elevated from an elevated Windows Driver ([#4234](https://github.com/helderperez-dev/reavion-driver/issues/4234)) ([6650ac5](https://github.com/helderperez-dev/reavion-driver/commit/6650ac56c5912d60379805deb46a2ccc3cc749e3))

## [0.30.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.29.1...reavion-driver-rs-v0.30.0) (2026-09-26)


### Features

* **reavion-driver:** bound recording turn state capture and add start_recording budget options ([#4215](https://github.com/helderperez-dev/reavion-driver/issues/4215)) ([5b3d48d](https://github.com/helderperez-dev/reavion-driver/commit/5b3d48dfda23bde15ae1f2c150940defbdc64c21))


### Bug Fixes

* **reavion-driver:** allow reinstalling the trusted extension catalog after removal ([#4212](https://github.com/helderperez-dev/reavion-driver/issues/4212)) ([0263cfe](https://github.com/helderperez-dev/reavion-driver/commit/0263cfebab9ebf5213adc97133294449aeb49e02)), closes [#4211](https://github.com/helderperez-dev/reavion-driver/issues/4211)
* **reavion-driver:** attribute X11 windows without _NET_WM_PID via X-Resource ([#4214](https://github.com/helderperez-dev/reavion-driver/issues/4214)) ([a02df78](https://github.com/helderperez-dev/reavion-driver/commit/a02df78c40b3d2b8e8f44e1cc4a67d70c6efdef3)), closes [#3894](https://github.com/helderperez-dev/reavion-driver/issues/3894)
* **reavion-driver:** explain elevated-token refusal of Windows isolated browsers ([#4178](https://github.com/helderperez-dev/reavion-driver/issues/4178)) ([ec96f96](https://github.com/helderperez-dev/reavion-driver/commit/ec96f96b48ed337ea917fc333c6bf7bdd040934c)), closes [#4177](https://github.com/helderperez-dev/reavion-driver/issues/4177)
* **reavion-driver:** move the pointer for macOS foreground pixel clicks ([#4208](https://github.com/helderperez-dev/reavion-driver/issues/4208)) ([f0da502](https://github.com/helderperez-dev/reavion-driver/commit/f0da502ac3f477253dd08e87976a39cca274fd16)), closes [#4207](https://github.com/helderperez-dev/reavion-driver/issues/4207)
* **reavion-driver:** polish CLI pipe, extension, schema, and output-path UX ([#4210](https://github.com/helderperez-dev/reavion-driver/issues/4210)) ([70b87b4](https://github.com/helderperez-dev/reavion-driver/commit/70b87b4f26d8bb217f32b4942a677024dbc2b651)), closes [#4209](https://github.com/helderperez-dev/reavion-driver/issues/4209)
* **reavion-driver:** refuse Linux background clicks that only hit a Chromium frame ([#4188](https://github.com/helderperez-dev/reavion-driver/issues/4188)) ([7ee9b37](https://github.com/helderperez-dev/reavion-driver/commit/7ee9b37edc4ebc5f7f606682ae2699d1baa5d397))
* **reavion-driver:** resolve the perception extension per parse on a live runtime ([#4197](https://github.com/helderperez-dev/reavion-driver/issues/4197)) ([e8777e6](https://github.com/helderperez-dev/reavion-driver/commit/e8777e6d6a997476cc254146ade31f772c56ec48)), closes [#4193](https://github.com/helderperez-dev/reavion-driver/issues/4193)
* **reavion-driver:** wait for macOS recordings to finish writing before reporting them finalized ([#4238](https://github.com/helderperez-dev/reavion-driver/issues/4238)) ([7a0fe0b](https://github.com/helderperez-dev/reavion-driver/commit/7a0fe0b0ba6c58de586c863d79ef41976233b1e7)), closes [#4237](https://github.com/helderperez-dev/reavion-driver/issues/4237)

## [0.29.1](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.29.0...reavion-driver-rs-v0.29.1) (2026-09-25)


### Bug Fixes

* **reavion-driver:** finish Edge 153 session cleanup when its accessibility tree is briefly empty ([#4158](https://github.com/helderperez-dev/reavion-driver/issues/4158)) ([0b9a1bb](https://github.com/helderperez-dev/reavion-driver/commit/0b9a1bb46ffcc1dad600691b6623bd959758b07a)), closes [#4121](https://github.com/helderperez-dev/reavion-driver/issues/4121) [#4094](https://github.com/helderperez-dev/reavion-driver/issues/4094)
* **reavion-driver:** keep a macOS selection when pixel typing into a focused field ([#4148](https://github.com/helderperez-dev/reavion-driver/issues/4148)) ([4ac7669](https://github.com/helderperez-dev/reavion-driver/commit/4ac7669ad63517cfea996a2e06a951f72e1503c1)), closes [#4125](https://github.com/helderperez-dev/reavion-driver/issues/4125) [#4094](https://github.com/helderperez-dev/reavion-driver/issues/4094)
* **reavion-driver:** make macOS existing-profile browser setup finish reliably ([#4160](https://github.com/helderperez-dev/reavion-driver/issues/4160)) ([ccc6243](https://github.com/helderperez-dev/reavion-driver/commit/ccc6243ddb47ee400fca873cd5f0db89e4732f67))

## [0.29.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.28.4...reavion-driver-rs-v0.29.0) (2026-09-25)


### Features

* **reavion-driver:** let embedding hosts bound the post-action window observation ([#3929](https://github.com/helderperez-dev/reavion-driver/issues/3929)) ([1435052](https://github.com/helderperez-dev/reavion-driver/commit/1435052d6aacecb9f9514d06bf2c11bf202520eb)), closes [#3928](https://github.com/helderperez-dev/reavion-driver/issues/3928) [#4094](https://github.com/helderperez-dev/reavion-driver/issues/4094)


### Bug Fixes

* **reavion-driver:** install the last signed macOS release ([#4150](https://github.com/helderperez-dev/reavion-driver/issues/4150)) ([fb7e972](https://github.com/helderperez-dev/reavion-driver/commit/fb7e9726d4ca2d9fe8b84f28b4db7c38d7fbc186))
* **reavion-driver:** keep page results whose title suffix only resembles a browser name ([#4103](https://github.com/helderperez-dev/reavion-driver/issues/4103)) ([2743728](https://github.com/helderperez-dev/reavion-driver/commit/27437286e634d0ac420336bb65c438b47436c8ca)), closes [#4094](https://github.com/helderperez-dev/reavion-driver/issues/4094)
* **reavion-driver:** keep the resting agent cursor animating on every platform ([#4131](https://github.com/helderperez-dev/reavion-driver/issues/4131)) ([7b4b595](https://github.com/helderperez-dev/reavion-driver/commit/7b4b595ef88dd3556e9e2649c903ae5fbdd15cb8))
* **reavion-driver:** match the Chromium 153 Windows remote-debugging consent prompt ([#4145](https://github.com/helderperez-dev/reavion-driver/issues/4145)) ([47b0e89](https://github.com/helderperez-dev/reavion-driver/commit/47b0e89c43f38c0d395143ee10e587a0273817ab)), closes [#4121](https://github.com/helderperez-dev/reavion-driver/issues/4121) [#4094](https://github.com/helderperez-dev/reavion-driver/issues/4094)
* **reavion-driver:** refuse to publish or bake an unsigned macOS release ([#4151](https://github.com/helderperez-dev/reavion-driver/issues/4151)) ([102a6c7](https://github.com/helderperez-dev/reavion-driver/commit/102a6c76a884dafd5c251d2e6ccc12df63afa77b)), closes [#4109](https://github.com/helderperez-dev/reavion-driver/issues/4109) [#4094](https://github.com/helderperez-dev/reavion-driver/issues/4094)
* **reavion-driver:** report agent cursor state before the cursor first moves ([#4123](https://github.com/helderperez-dev/reavion-driver/issues/4123)) ([3dbe331](https://github.com/helderperez-dev/reavion-driver/commit/3dbe331f12e8caa8615950903ee974bb3338737a))
* **reavion-driver:** report background_unavailable for Sway pixel scroll ([#4143](https://github.com/helderperez-dev/reavion-driver/issues/4143)) ([fe17a96](https://github.com/helderperez-dev/reavion-driver/commit/fe17a960cdd09e931437cf051b1ebeade15eca27)), closes [#4138](https://github.com/helderperez-dev/reavion-driver/issues/4138) [#4094](https://github.com/helderperez-dev/reavion-driver/issues/4094)
* **reavion-driver:** report the same capture refusal codes on every platform ([#4111](https://github.com/helderperez-dev/reavion-driver/issues/4111)) ([8946c6d](https://github.com/helderperez-dev/reavion-driver/commit/8946c6d4987181ae65e66c5a101e4030113a75a9)), closes [#4094](https://github.com/helderperez-dev/reavion-driver/issues/4094)
* **reavion-driver:** share browser DevTools parsing in core ([#4128](https://github.com/helderperez-dev/reavion-driver/issues/4128)) ([3fdb979](https://github.com/helderperez-dev/reavion-driver/commit/3fdb979a514613d5dbecd1ca7d58f90fea9667d9)), closes [#4094](https://github.com/helderperez-dev/reavion-driver/issues/4094)
* **reavion-driver:** share delivery mode and admission helpers in core ([#4139](https://github.com/helderperez-dev/reavion-driver/issues/4139)) ([4a64cb4](https://github.com/helderperez-dev/reavion-driver/commit/4a64cb46f4be4458e2b1383ca1983260a609f46a))

## [0.28.4](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.28.3...reavion-driver-rs-v0.28.4) (2026-09-24)


### Bug Fixes

* **reavion-driver:** keep background input working on macOS windows in other Spaces ([#4068](https://github.com/helderperez-dev/reavion-driver/issues/4068)) ([9f5fb90](https://github.com/helderperez-dev/reavion-driver/commit/9f5fb906ca8a17f63321283c83f0904947b1b446))
* **reavion-driver:** scope macOS off-Space AX window recovery ([#4085](https://github.com/helderperez-dev/reavion-driver/issues/4085)) ([2b824d4](https://github.com/helderperez-dev/reavion-driver/commit/2b824d4e09752b7dce67a2d8591e7ab7b30374aa))

## [0.28.3](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.28.2...reavion-driver-rs-v0.28.3) (2026-09-24)


### Features

* **reavion-driver:** add optional visual perception extension ([681bc44](https://github.com/helderperez-dev/reavion-driver/commit/681bc44807d1be81a4357f8e158f1c74a81d5a5b))
* **reavion-driver:** land background and foreground input on X11 desktops (OSWorld) and budget get_window_state walks on every platform ([#3882](https://github.com/helderperez-dev/reavion-driver/issues/3882)) ([7ffcdf1](https://github.com/helderperez-dev/reavion-driver/commit/7ffcdf13e635e5ba871a9d75b1b2102c4f80fa3e))
* **reavion-driver:** observe agent cursor moves/presses and report the system cursor shape ([#3883](https://github.com/helderperez-dev/reavion-driver/issues/3883)) ([7fe7c33](https://github.com/helderperez-dev/reavion-driver/commit/7fe7c33f741ee2dd5961ba80044d59f93b48ba47))


### Bug Fixes

* **reavion-driver:** correlate Chromium profile window titles ([#4030](https://github.com/helderperez-dev/reavion-driver/issues/4030)) ([210efbc](https://github.com/helderperez-dev/reavion-driver/commit/210efbceb46bf1acb0f66985a098262445d91e93)), closes [#4029](https://github.com/helderperez-dev/reavion-driver/issues/4029)
* **reavion-driver:** expose referenced MCP skill resources ([#4028](https://github.com/helderperez-dev/reavion-driver/issues/4028)) ([4eb8ab5](https://github.com/helderperez-dev/reavion-driver/commit/4eb8ab51e71b241316136805fe6191b7e2914e35))
* **reavion-driver:** hint foreground escalation on unavailable UIA clicks ([#3888](https://github.com/helderperez-dev/reavion-driver/issues/3888)) ([2f52f65](https://github.com/helderperez-dev/reavion-driver/commit/2f52f65acee92bebff6c0c4ca0877aacb9fa5b6b))
* **reavion-driver:** make skill workflows match runtime contracts ([#3719](https://github.com/helderperez-dev/reavion-driver/issues/3719)) ([6863ab6](https://github.com/helderperez-dev/reavion-driver/commit/6863ab6f11649f362d8c34401e19a46fe2a39a35))
* **reavion-driver:** preserve observed X11 click identities ([#3864](https://github.com/helderperez-dev/reavion-driver/issues/3864)) ([27062ed](https://github.com/helderperez-dev/reavion-driver/commit/27062ed04a36a5aa1969fa44f58349d16f0bdc13))
* **reavion-driver:** report daemon_running accurately from socket liveness ([#4019](https://github.com/helderperez-dev/reavion-driver/issues/4019)) ([27a318c](https://github.com/helderperez-dev/reavion-driver/commit/27a318c3a616f9ff19d24fe2acca7517c5f8fa7b))
* **reavion-driver:** report surviving local install on uninstall ([#3021](https://github.com/helderperez-dev/reavion-driver/issues/3021)) ([625118a](https://github.com/helderperez-dev/reavion-driver/commit/625118a9076e51da2f57b6a5d475972030197443))
* **reavion-driver:** rotate the perception extension signing key ([#4072](https://github.com/helderperez-dev/reavion-driver/issues/4072)) ([cf07615](https://github.com/helderperez-dev/reavion-driver/commit/cf0761552675c6fb020d5950ca7003c9a7e40997))
* **reavion-driver:** stabilize Hyprland agent input ([f6be600](https://github.com/helderperez-dev/reavion-driver/commit/f6be60087b8d1bb3d0a822ea11736761b8b8ace0))

## [0.28.2](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.28.1...reavion-driver-rs-v0.28.2) (2026-09-15)


### Bug Fixes

* **reavion-driver:** capture macOS desktops without relying on PATH ([#3755](https://github.com/helderperez-dev/reavion-driver/issues/3755)) ([f67be12](https://github.com/helderperez-dev/reavion-driver/commit/f67be123e198f322ba22ead5aff54f2ed119b366))
* **reavion-driver:** preserve semantic Hyprland AX scrolling ([#3820](https://github.com/helderperez-dev/reavion-driver/issues/3820)) ([72b8707](https://github.com/helderperez-dev/reavion-driver/commit/72b8707cfbdfa3cec5b3f563acdd62ac42aee266)), closes [#3819](https://github.com/helderperez-dev/reavion-driver/issues/3819)
* **reavion-driver:** route background text through Hyprland input ([#3877](https://github.com/helderperez-dev/reavion-driver/issues/3877)) ([42d764b](https://github.com/helderperez-dev/reavion-driver/commit/42d764bb19e9873b581d7147453942484dc4839b))
* **reavion-driver:** unify desktop snapshot identity and payload ownership ([#3616](https://github.com/helderperez-dev/reavion-driver/issues/3616)) ([a8a7b1e](https://github.com/helderperez-dev/reavion-driver/commit/a8a7b1e5e53fe8284de04dcac4f04c14b53fd0a1))

## [0.28.1](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.28.0...reavion-driver-rs-v0.28.1) (2026-09-12)


### Bug Fixes

* **reavion-driver:** exclude cursor overlay from foreground verification ([#3704](https://github.com/helderperez-dev/reavion-driver/issues/3704)) ([44c9d1f](https://github.com/helderperez-dev/reavion-driver/commit/44c9d1f6d5c9c41c04ab833f022a26d7a97b5ad0))
* **reavion-driver:** link skills for fresh Codex and Claude installs ([#3742](https://github.com/helderperez-dev/reavion-driver/issues/3742)) ([95a361c](https://github.com/helderperez-dev/reavion-driver/commit/95a361cef318658a94280db7448b03d1933d2987))
* **reavion-driver:** preserve X11 keyboard delivery and timing ([#3761](https://github.com/helderperez-dev/reavion-driver/issues/3761)) ([ce99b96](https://github.com/helderperez-dev/reavion-driver/commit/ce99b969f2af23c313f9e38aed980779debfe848))
* **reavion-driver:** report encoder exit and shutdown timeout errors ([#3714](https://github.com/helderperez-dev/reavion-driver/issues/3714)) ([eca08d3](https://github.com/helderperez-dev/reavion-driver/commit/eca08d3144c663edba6cdd395bf9957b2b5a5209))
* **reavion-driver:** restore embedded-host builds on macOS and Linux ([#3687](https://github.com/helderperez-dev/reavion-driver/issues/3687)) ([2dbc1c2](https://github.com/helderperez-dev/reavion-driver/commit/2dbc1c2cfbee5d25c9cea2dc37db80b98d4f9b00))

## [0.28.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.27.0...reavion-driver-rs-v0.28.0) (2026-09-11)


### Features

* **reavion-driver:** support modern stdio MCP and skills resources ([9dd3013](https://github.com/helderperez-dev/reavion-driver/commit/9dd3013fbdbc5ce403a7b383c4d69c9f4aac1f03))

## [0.27.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.26.1...reavion-driver-rs-v0.27.0) (2026-09-11)


### Features

* **reavion-driver:** share typed MCP connection across language bindings ([#3715](https://github.com/helderperez-dev/reavion-driver/issues/3715)) ([481f3ec](https://github.com/helderperez-dev/reavion-driver/commit/481f3ece21b89398e26d96fd87dee520b0118602))


### Bug Fixes

* **reavion-driver:** eliminate duplicate Swift bridge symbols ([#3680](https://github.com/helderperez-dev/reavion-driver/issues/3680)) ([2ec5858](https://github.com/helderperez-dev/reavion-driver/commit/2ec5858d1142f2b8f0528053fe03bd191333e4f6))
* **reavion-driver:** normalize repeated macOS consent labels ([#3706](https://github.com/helderperez-dev/reavion-driver/issues/3706)) ([4c96f24](https://github.com/helderperez-dev/reavion-driver/commit/4c96f24968ec3c7acc031af07651dbf7187636b7))
* **reavion-driver:** retry safe Hyprland stale geometry refusals ([#3732](https://github.com/helderperez-dev/reavion-driver/issues/3732)) ([27078d8](https://github.com/helderperez-dev/reavion-driver/commit/27078d896498c87e6f662a75df07ed78250bb542))

## [0.26.1](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.26.0...reavion-driver-rs-v0.26.1) (2026-09-10)


### Bug Fixes

* **reavion-driver:** retain inert Hyprland pointer on desktop faults ([#3702](https://github.com/helderperez-dev/reavion-driver/issues/3702)) ([648c251](https://github.com/helderperez-dev/reavion-driver/commit/648c251400ebb356f6d7dbc3d0c835690b9bb4b4))

## [0.26.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.25.0...reavion-driver-rs-v0.26.0) (2026-09-10)


### ⚠ BREAKING CHANGES

* **reavion-driver:** ClickInput now requires target, position, and delivery_mode; click returns ActionResult directly and raises typed tool errors for refusals.

### Features

* **reavion-driver:** carry typed envelopes through opt-in MCP streams ([#3692](https://github.com/helderperez-dev/reavion-driver/issues/3692)) ([1138b9b](https://github.com/helderperez-dev/reavion-driver/commit/1138b9bd1ed9858d7866259e38451e79af62c8df))
* **reavion-driver:** expose typed native-window SDK flow ([#3683](https://github.com/helderperez-dev/reavion-driver/issues/3683)) ([75b04aa](https://github.com/helderperez-dev/reavion-driver/commit/75b04aac03ed6cb1e08c41b2384595e5c5ab2d9f))


### Bug Fixes

* **reavion-driver:** admit typed remote window observation ([#3695](https://github.com/helderperez-dev/reavion-driver/issues/3695)) ([e08829b](https://github.com/helderperez-dev/reavion-driver/commit/e08829b8e5b53c69e83f256541b660024e0e71a9))

## [0.25.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.24.0...reavion-driver-rs-v0.25.0) (2026-09-09)


### Features

* **reavion-driver:** add bounded typed guest envelope receiver ([#3650](https://github.com/helderperez-dev/reavion-driver/issues/3650)) ([542c98f](https://github.com/helderperez-dev/reavion-driver/commit/542c98fafab2a75dfb8147493e0c12e65f8e7580))
* **reavion-driver:** add private loopback envelope HTTP carrier ([#3653](https://github.com/helderperez-dev/reavion-driver/issues/3653)) ([c5898ef](https://github.com/helderperez-dev/reavion-driver/commit/c5898ef4bf092f3a47bc80e226a0016923b4739b))
* **reavion-driver:** expose foreign remote envelope channels ([#3651](https://github.com/helderperez-dev/reavion-driver/issues/3651)) ([04559df](https://github.com/helderperez-dev/reavion-driver/commit/04559df66c0b9303c559fa575a78f036285bf7e7))
* **reavion-driver:** integrate typed Driver access with Fleet Sandbox ([#3654](https://github.com/helderperez-dev/reavion-driver/issues/3654)) ([c9c29dc](https://github.com/helderperez-dev/reavion-driver/commit/c9c29dcffea354e3ae0cf75927845e79c9d38028))


### Bug Fixes

* **reavion-driver:** correct macos click delivery and recording evidence ([#2907](https://github.com/helderperez-dev/reavion-driver/issues/2907)) ([467c103](https://github.com/helderperez-dev/reavion-driver/commit/467c103be28384502cdd77b9edd5ea46da0b8ded))
* **reavion-driver:** leave pacman-managed updates to pacman ([#3636](https://github.com/helderperez-dev/reavion-driver/issues/3636)) ([00678fa](https://github.com/helderperez-dev/reavion-driver/commit/00678fa8ec8f0f371716993ae4a207df812ef667))
* **reavion-driver:** preserve unavailable Windows UIA clicks ([#3671](https://github.com/helderperez-dev/reavion-driver/issues/3671)) ([7b7db5f](https://github.com/helderperez-dev/reavion-driver/commit/7b7db5f42898ac4f96f49aba1d46016bceeed7af))
* **reavion-driver:** read macOS browser checkbox state ([#3404](https://github.com/helderperez-dev/reavion-driver/issues/3404)) ([b117093](https://github.com/helderperez-dev/reavion-driver/commit/b1170930589691fd1101f6943410f32e57bda8b6))
* **reavion-driver:** recover slow Windows UIA health probes ([#3109](https://github.com/helderperez-dev/reavion-driver/issues/3109)) ([27736b3](https://github.com/helderperez-dev/reavion-driver/commit/27736b3ab97d9aed8bebaa548c3b08892bcb8ec5))

## [0.24.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.23.2...reavion-driver-rs-v0.24.0) (2026-09-07)


### Features

* **reavion-driver:** add qualified Hyprland isolated input ([#3572](https://github.com/helderperez-dev/reavion-driver/issues/3572)) ([c5a15f3](https://github.com/helderperez-dev/reavion-driver/commit/c5a15f3df3b29ffbe774de9f33d632fe75afec75))
* **reavion-driver:** expose action names in get_window_state elements ([#3617](https://github.com/helderperez-dev/reavion-driver/issues/3617)) ([7e89120](https://github.com/helderperez-dev/reavion-driver/commit/7e89120c062476a97bf3403363b3087a0cf0a74c))
* **reavion-driver:** let get_window_state skip the a11y tree and return capture metadata ([#3516](https://github.com/helderperez-dev/reavion-driver/issues/3516)) ([808c014](https://github.com/helderperez-dev/reavion-driver/commit/808c0142dc7c8c84cde3a0d1fc5118194898a7a3))


### Bug Fixes

* **reavion-driver:** accept host identity in embedded health check ([#2170](https://github.com/helderperez-dev/reavion-driver/issues/2170)) ([8a3d79a](https://github.com/helderperez-dev/reavion-driver/commit/8a3d79aa79443ee3b821903c3e596463732ed18f))
* **reavion-driver:** authenticate history requests lazily ([#3505](https://github.com/helderperez-dev/reavion-driver/issues/3505)) ([50f54be](https://github.com/helderperez-dev/reavion-driver/commit/50f54be5ba7e2dfe09d3738fec00dd394e9c44cc))
* **reavion-driver:** drain daemon state on shutdown ([#3348](https://github.com/helderperez-dev/reavion-driver/issues/3348)) ([aabb208](https://github.com/helderperez-dev/reavion-driver/commit/aabb2082c170289256f0c8d9db4cce094c778578))
* **reavion-driver:** persist macOS direct capture verification ([#2904](https://github.com/helderperez-dev/reavion-driver/issues/2904)) ([605ce1a](https://github.com/helderperez-dev/reavion-driver/commit/605ce1aec80eb73e23ea4c3622b935147a80a572))
* **reavion-driver:** recover owned orphaned X11 master devices ([#3601](https://github.com/helderperez-dev/reavion-driver/issues/3601)) ([76e00c7](https://github.com/helderperez-dev/reavion-driver/commit/76e00c75e81b17f779d56e2aa6b5a27d691066a9))
* **reavion-driver:** support Bedrock browser prepare schema ([#3311](https://github.com/helderperez-dev/reavion-driver/issues/3311)) ([e05a5ca](https://github.com/helderperez-dev/reavion-driver/commit/e05a5caee9ec6e40e037e94b8996081eadd9d660))
* **reavion-driver:** verify native Hyprland capture and observation ([#3557](https://github.com/helderperez-dev/reavion-driver/issues/3557)) ([3513443](https://github.com/helderperez-dev/reavion-driver/commit/3513443c9df87468cabe85814a569150d41555cd))


### Performance Improvements

* **reavion-driver:** read the macOS product version in-process in health_report ([#3491](https://github.com/helderperez-dev/reavion-driver/issues/3491)) ([936646b](https://github.com/helderperez-dev/reavion-driver/commit/936646b567ed21ed5e1e609458c0c2d226f361a6))

## [0.23.2](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.23.1...reavion-driver-rs-v0.23.2) (2026-08-31)


### Bug Fixes

* **reavion-driver:** clean up unresolved Chrome consent UI ([#3468](https://github.com/helderperez-dev/reavion-driver/issues/3468)) ([e729547](https://github.com/helderperez-dev/reavion-driver/commit/e7295472e196b22e1d02a69441b315a3776d50fb))

## [0.23.1](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.23.0...reavion-driver-rs-v0.23.1) (2026-08-31)


### Bug Fixes

* **reavion-driver:** harden cross-platform e2e evidence ([99f27ee](https://github.com/helderperez-dev/reavion-driver/commit/99f27eeb96481a155fe10f6dee6a131cc0de8b9e))

## [0.23.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.22.2...reavion-driver-rs-v0.23.0) (2026-08-30)


### Features

* **reavion-driver:** add session-based Agent View across desktops ([#3431](https://github.com/helderperez-dev/reavion-driver/issues/3431)) ([57981a1](https://github.com/helderperez-dev/reavion-driver/commit/57981a16f8c16a72955ac06d3a98dbcc0f9ca4b6))
* **reavion-driver:** add trusted KDE KWin Wayland target identity adapter ([#3336](https://github.com/helderperez-dev/reavion-driver/issues/3336)) ([9596fb3](https://github.com/helderperez-dev/reavion-driver/commit/9596fb334f3eeec541979ccf5f0ef9ef360da0c6))
* **reavion-driver:** advertise native Wayland build features ([#2669](https://github.com/helderperez-dev/reavion-driver/issues/2669)) ([31c61dd](https://github.com/helderperez-dev/reavion-driver/commit/31c61dd161ea4a27a5e719e71a2eb469b89d924d))


### Bug Fixes

* **reavion-driver:** bind uninstall signals to process generation ([#3446](https://github.com/helderperez-dev/reavion-driver/issues/3446)) ([63c700d](https://github.com/helderperez-dev/reavion-driver/commit/63c700d78aec868e7151c8d982263a4f7f146ade))
* **reavion-driver:** keep macOS daemon stable during permission setup ([#3314](https://github.com/helderperez-dev/reavion-driver/issues/3314)) ([dbf0d3a](https://github.com/helderperez-dev/reavion-driver/commit/dbf0d3a450d9c4fc3a0a768faf0ce9b3283f908e))
* **reavion-driver:** make Agent View opt-in by default ([8d94261](https://github.com/helderperez-dev/reavion-driver/commit/8d942610dc6c43b97d0ca54761a998ae21ee1fed))
* **reavion-driver:** stop the serve daemon in the Unix release uninstaller ([#3340](https://github.com/helderperez-dev/reavion-driver/issues/3340)) ([45c256b](https://github.com/helderperez-dev/reavion-driver/commit/45c256bc826c13e6c0667b9891c4ce4ab0e635af))


### Reverts

* **reavion-driver:** remove native Agent View presentation ([#3452](https://github.com/helderperez-dev/reavion-driver/issues/3452)) ([47452be](https://github.com/helderperez-dev/reavion-driver/commit/47452be2da82cbfe71d6a13bb0d5afd83502eef5))

## [0.22.2](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.22.1...reavion-driver-rs-v0.22.2) (2026-08-27)


### Bug Fixes

* **reavion-driver:** align Wayland capture, focus, and overlays ([#3152](https://github.com/helderperez-dev/reavion-driver/issues/3152)) ([2fc59ea](https://github.com/helderperez-dev/reavion-driver/commit/2fc59ea943a03e7ab74f948b478afac6765493b5))
* **reavion-driver:** report macOS Retina backing scale ([#3328](https://github.com/helderperez-dev/reavion-driver/issues/3328)) ([9029514](https://github.com/helderperez-dev/reavion-driver/commit/90295148d34dac8e5a1307bac917e08171af5839))

## [0.22.1](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.22.0...reavion-driver-rs-v0.22.1) (2026-08-25)


### Bug Fixes

* **reavion-driver:** clean up Chromium remote debugging after browser sessions ([#3372](https://github.com/helderperez-dev/reavion-driver/issues/3372)) ([85d7779](https://github.com/helderperez-dev/reavion-driver/commit/85d77792e2f400a88f4b77c1218e388945c4b01c))

## [0.22.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.21.0...reavion-driver-rs-v0.22.0) (2026-08-24)


### Features

* **reavion-driver:** configure embedded daemon overlay ([#3280](https://github.com/helderperez-dev/reavion-driver/issues/3280)) ([3ae080d](https://github.com/helderperez-dev/reavion-driver/commit/3ae080d366b0fc514ef03b8f5136f29e7477c2ae))


### Bug Fixes

* **reavion-driver:** block uinput pointer hotplug on KDE X11 ([#2888](https://github.com/helderperez-dev/reavion-driver/issues/2888)) ([56f13c3](https://github.com/helderperez-dev/reavion-driver/commit/56f13c360a8b678960747c50f2680e40c14ae346))
* **reavion-driver:** honor HERMES_HOME for skill links ([#3291](https://github.com/helderperez-dev/reavion-driver/issues/3291)) ([9a61050](https://github.com/helderperez-dev/reavion-driver/commit/9a61050e3474fc9488d7adc85184299f02514d0e))
* **reavion-driver:** make Windows browser prepare language independent ([#3135](https://github.com/helderperez-dev/reavion-driver/issues/3135)) ([9bf47f6](https://github.com/helderperez-dev/reavion-driver/commit/9bf47f65dda1bc33bdd19dabb94c56b691f39ca0))
* **reavion-driver:** match canonical Windows executable paths ([#3299](https://github.com/helderperez-dev/reavion-driver/issues/3299)) ([a682895](https://github.com/helderperez-dev/reavion-driver/commit/a6828955187f3554682065c88f6cb770f107095a))
* **reavion-driver:** normalize legacy dispatch before authorization ([#3037](https://github.com/helderperez-dev/reavion-driver/issues/3037)) ([d138baa](https://github.com/helderperez-dev/reavion-driver/commit/d138baa96a1b4a379dfb498c17101f20cfcf7aef))
* **reavion-driver:** preserve embedded telemetry preference ([#3277](https://github.com/helderperez-dev/reavion-driver/issues/3277)) ([2c8fa2a](https://github.com/helderperez-dev/reavion-driver/commit/2c8fa2a73d87d858520a3acfabc9b6a54479960c))
* **reavion-driver:** preserve TCC across release updates ([#3297](https://github.com/helderperez-dev/reavion-driver/issues/3297)) ([1542a71](https://github.com/helderperez-dev/reavion-driver/commit/1542a717ac65b500d1a524152bcf742d4d311c63))
* **reavion-driver:** reset stale local TCC rows after ad-hoc rebuilds ([#2747](https://github.com/helderperez-dev/reavion-driver/issues/2747)) ([ee09e86](https://github.com/helderperez-dev/reavion-driver/commit/ee09e869727ce1f80793b0dd830a29139cb6fffa))

## [0.21.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.20.0...reavion-driver-rs-v0.21.0) (2026-08-19)


### Features

* **reavion-driver:** extend Project Centennial across desktop platforms ([#3189](https://github.com/helderperez-dev/reavion-driver/issues/3189)) ([a744308](https://github.com/helderperez-dev/reavion-driver/commit/a74430843663d3840dffbee04c2e112783ad238e))
* **reavion-driver:** Project Centennial preview ([#3188](https://github.com/helderperez-dev/reavion-driver/issues/3188)) ([61e51cd](https://github.com/helderperez-dev/reavion-driver/commit/61e51cddc48edcd0ae350a1744890c04951027f1))


### Bug Fixes

* **reavion-driver:** admit stable local history signatures ([#3262](https://github.com/helderperez-dev/reavion-driver/issues/3262)) ([4864ccd](https://github.com/helderperez-dev/reavion-driver/commit/4864ccd42673eaa535d5e5ad01f2e30b484a0b02))
* **reavion-driver:** attribute hosted Windows apps by window ([#3227](https://github.com/helderperez-dev/reavion-driver/issues/3227)) ([30d9130](https://github.com/helderperez-dev/reavion-driver/commit/30d9130f7c747d9d3ecb2a5eca5b53366db5f1bb))
* **reavion-driver:** drop the stale 0.17 version from element_index messages ([e14891a](https://github.com/helderperez-dev/reavion-driver/commit/e14891ae957d710e4e5cbdc1e08e8bffd355cd88))
* **reavion-driver:** harden consented existing-profile attachment ([#3211](https://github.com/helderperez-dev/reavion-driver/issues/3211)) ([3f791b2](https://github.com/helderperez-dev/reavion-driver/commit/3f791b2cfec23d690cd34e6d275b6cbe1a8acc05))
* **reavion-driver:** launch isolated browser without pid ([#3208](https://github.com/helderperez-dev/reavion-driver/issues/3208)) ([eaf5a34](https://github.com/helderperez-dev/reavion-driver/commit/eaf5a34ea7804f8837bf39f7453e4beb5e6dce39))
* **reavion-driver:** preserve history admission on macOS relaunch ([#3245](https://github.com/helderperez-dev/reavion-driver/issues/3245)) ([9045b0c](https://github.com/helderperez-dev/reavion-driver/commit/9045b0c74f7c7de72fde3d9dc622f2cacf1cf848))
* **reavion-driver:** refuse unproven Wayland window capture ([#3200](https://github.com/helderperez-dev/reavion-driver/issues/3200)) ([c78c1d8](https://github.com/helderperez-dev/reavion-driver/commit/c78c1d873b5c091a951716559d2ccc1dc2f7a0e6))
* **reavion-driver:** strip UTF-8 BOM from uninstall.ps1 ([da44420](https://github.com/helderperez-dev/reavion-driver/commit/da44420193b59e845887db1f6c4adf27fbb2ffb8)), closes [#3174](https://github.com/helderperez-dev/reavion-driver/issues/3174)
* **reavion-driver:** tell operators to reconnect agent sessions after history enable ([#3224](https://github.com/helderperez-dev/reavion-driver/issues/3224)) ([62ede45](https://github.com/helderperez-dev/reavion-driver/commit/62ede45ad8450e341e9521bb8a8f81c9705f1c12)), closes [#3220](https://github.com/helderperez-dev/reavion-driver/issues/3220)
* **reavion-driver:** tolerate missing local autostart task ([#3229](https://github.com/helderperez-dev/reavion-driver/issues/3229)) ([f913244](https://github.com/helderperez-dev/reavion-driver/commit/f9132440013edaf99937682ea3ad44326ae16df2))

## [0.20.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.19.3...reavion-driver-rs-v0.20.0) (2026-08-15)


### ⚠ BREAKING CHANGES

* **reavion-driver:** remove browser approval tokens ([#3185](https://github.com/helderperez-dev/reavion-driver/issues/3185))

### Features

* add immutable Driver and Lume nightly releases ([8cef90b](https://github.com/helderperez-dev/reavion-driver/commit/8cef90b7ce6f85793a0ca3a3ddc050eac01b6b83))
* add persistent Driver and Lume release channels ([0813659](https://github.com/helderperez-dev/reavion-driver/commit/0813659ac237cd46da21c2a51f9a95f27a3e7845))
* **reavion-driver:** add implicit lifecycle sessions ([#3013](https://github.com/helderperez-dev/reavion-driver/issues/3013)) ([858ef13](https://github.com/helderperez-dev/reavion-driver/commit/858ef13a5b1f2630b074d8f588a25cb0b19cab25))
* **reavion-driver:** apply capability manifests across permission profiles ([#3015](https://github.com/helderperez-dev/reavion-driver/issues/3015)) ([3a53e53](https://github.com/helderperez-dev/reavion-driver/commit/3a53e53f99dcf8d5ed761c5cd0b5dd039c916121))
* **reavion-driver:** remove browser approval tokens ([#3185](https://github.com/helderperez-dev/reavion-driver/issues/3185)) ([0d7c011](https://github.com/helderperez-dev/reavion-driver/commit/0d7c011eb31526d9c2b500806f35523dc2bdfb0e))


### Bug Fixes

* **reavion-driver:** align agent guidance with lifecycle sessions ([#3041](https://github.com/helderperez-dev/reavion-driver/issues/3041)) ([dbde09e](https://github.com/helderperez-dev/reavion-driver/commit/dbde09e0bfd39abbc374e2e9aade86086e773bb8))
* **reavion-driver:** hide policy-disabled MCP tools ([#3132](https://github.com/helderperez-dev/reavion-driver/issues/3132)) ([1532830](https://github.com/helderperez-dev/reavion-driver/commit/1532830d3d5c6e5db22198130d82a4741a7b4a2f))
* **reavion-driver:** preserve direct MCP session ownership ([#3079](https://github.com/helderperez-dev/reavion-driver/issues/3079)) ([d509687](https://github.com/helderperez-dev/reavion-driver/commit/d5096871d088c2e5b5942d678f2c127840061d7d))
* **reavion-driver:** preserve named CLI sessions ([#3144](https://github.com/helderperez-dev/reavion-driver/issues/3144)) ([1803e52](https://github.com/helderperez-dev/reavion-driver/commit/1803e52d0c4a94d88787706cfe89eccb6dc723db))
* **reavion-driver:** reject misplaced MCP permission flags ([#3085](https://github.com/helderperez-dev/reavion-driver/issues/3085)) ([a5bc265](https://github.com/helderperez-dev/reavion-driver/commit/a5bc2651c10dc64f4779f2c9fd99bfddb9905ffb))
* **reavion-driver:** stage current skill pack on Windows local installs ([#3083](https://github.com/helderperez-dev/reavion-driver/issues/3083)) ([b4bc58a](https://github.com/helderperez-dev/reavion-driver/commit/b4bc58a3a262f30fcd9d6772851cde0f3429deb6))
* **reavion-driver:** verify foreground focus before input ([#3068](https://github.com/helderperez-dev/reavion-driver/issues/3068)) ([f9192dd](https://github.com/helderperez-dev/reavion-driver/commit/f9192dde69dd85ff6c5ad0bf4731d33ebc7d20d3))
* **reavion-driver:** write the update-check cache to the canonical home ([#3032](https://github.com/helderperez-dev/reavion-driver/issues/3032)) ([69e5774](https://github.com/helderperez-dev/reavion-driver/commit/69e57742751407258f2189ec2c4bb21fba78da2e))

## [0.19.3](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.19.2...reavion-driver-rs-v0.19.3) (2026-08-10)


### Bug Fixes

* **reavion-driver:** remove Windows npm VC runtime prerequisite ([#3038](https://github.com/helderperez-dev/reavion-driver/issues/3038)) ([c167125](https://github.com/helderperez-dev/reavion-driver/commit/c167125e1bb0c4fe515beddc0d480f573f3c6077))

## [0.19.2](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.19.1...reavion-driver-rs-v0.19.2) (2026-08-07)


### Bug Fixes

* **reavion-driver:** constrain incompatible zune-core resolution ([#2984](https://github.com/helderperez-dev/reavion-driver/issues/2984)) ([1979ab7](https://github.com/helderperez-dev/reavion-driver/commit/1979ab73fdcdba130a54467ca7072c447011f7ab))
* **reavion-driver:** make MCP output schemas object-rooted ([96d87ad](https://github.com/helderperez-dev/reavion-driver/commit/96d87adb248d746aed2a5427b1a256dbd3f1ae1a))
* **reavion-driver:** reap Linux launch_app children instead of leaking zombies ([#2974](https://github.com/helderperez-dev/reavion-driver/issues/2974)) ([f91d78e](https://github.com/helderperez-dev/reavion-driver/commit/f91d78e49a74fd7a690100957886e93e185655e2))

## [0.19.1](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.19.0...reavion-driver-rs-v0.19.1) (2026-08-07)


### Bug Fixes

* **reavion-driver:** advertise refusals in the MCP outputSchema ([#2968](https://github.com/helderperez-dev/reavion-driver/issues/2968)) ([dc6f32c](https://github.com/helderperez-dev/reavion-driver/commit/dc6f32cd4d32bb0a60e18674086f443f9d9d8288))
* **reavion-driver:** record launch provenance for sessionless launch_app so kill_app can reprove it ([#2966](https://github.com/helderperez-dev/reavion-driver/issues/2966)) ([b065550](https://github.com/helderperez-dev/reavion-driver/commit/b06555075fc0ccc14df7e17d33b7eb27d97c9c53)), closes [#2965](https://github.com/helderperez-dev/reavion-driver/issues/2965)
* **reavion-driver:** resolve Linux launch_app names via .desktop entries and surface xdg-open failures ([#2954](https://github.com/helderperez-dev/reavion-driver/issues/2954)) ([fb4b492](https://github.com/helderperez-dev/reavion-driver/commit/fb4b492cd997dd3e8659298adfd98825974ebb7e))
* **reavion-driver:** survive z-order BadMatch under reparenting WMs so the Linux agent cursor can paint ([#2957](https://github.com/helderperez-dev/reavion-driver/issues/2957)) ([9522358](https://github.com/helderperez-dev/reavion-driver/commit/9522358294f34aba138221e87d3dbb79486b199a)), closes [#2955](https://github.com/helderperez-dev/reavion-driver/issues/2955)

## [0.19.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.18.0...reavion-driver-rs-v0.19.0) (2026-08-06)


### Features

* **reavion-driver:** support Prime Agent skill onboarding ([#2944](https://github.com/helderperez-dev/reavion-driver/issues/2944)) ([0f796d0](https://github.com/helderperez-dev/reavion-driver/commit/0f796d0659877bee3404d11eef566cfbcbf8edf1))


### Bug Fixes

* **reavion-driver:** Linux cursor overlay compositing, xrdp-family servers, and resting float ([#2940](https://github.com/helderperez-dev/reavion-driver/issues/2940)) ([997d6d8](https://github.com/helderperez-dev/reavion-driver/commit/997d6d86433254ccf12e5dbf1edcb46bf05eb5ac))
* **reavion-driver:** resolve SDK release from run artifacts ([#2926](https://github.com/helderperez-dev/reavion-driver/issues/2926)) ([3cd9de9](https://github.com/helderperez-dev/reavion-driver/commit/3cd9de9a32bf6b4a98a2186c1535054bd740bb21))

## [0.18.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.17.0...reavion-driver-rs-v0.18.0) (2026-08-05)


### Features

* **reavion-driver:** add macOS Spaces awareness to list_windows ([#2850](https://github.com/helderperez-dev/reavion-driver/issues/2850)) ([f7404b4](https://github.com/helderperez-dev/reavion-driver/commit/f7404b40287c128b15afa30b6c6f9024cbf081b8))
* **reavion-driver:** drop the session orb from the cursor badge ([#2842](https://github.com/helderperez-dev/reavion-driver/issues/2842)) ([59f280e](https://github.com/helderperez-dev/reavion-driver/commit/59f280e485be4f58811bda6a9e2dbe7632b9b63c))
* **reavion-driver:** exact-target macOS background input v1 ([#2837](https://github.com/helderperez-dev/reavion-driver/issues/2837)) ([1b2cb5a](https://github.com/helderperez-dev/reavion-driver/commit/1b2cb5a706c3e5d636b683ab15336dbf35e579e0))


### Bug Fixes

* **reavion-driver:** avoid accessibility advertise on Cinnamon ([#2784](https://github.com/helderperez-dev/reavion-driver/issues/2784)) ([b3ba121](https://github.com/helderperez-dev/reavion-driver/commit/b3ba12126188e1540b93d7c51d55926299fd36ab))
* **reavion-driver:** avoid retrying deferred text writes ([7e0d6bc](https://github.com/helderperez-dev/reavion-driver/commit/7e0d6bcb5d7ca55d9da1ff3e8acc1bdddf6fa422))
* **reavion-driver:** bound large macOS text synthesis ([#2863](https://github.com/helderperez-dev/reavion-driver/issues/2863)) ([a6b87e0](https://github.com/helderperez-dev/reavion-driver/commit/a6b87e01af9c3f291a40a9d7f4e6301418b2a8ab))
* **reavion-driver:** bound Linux AT-SPI listener startup ([#2827](https://github.com/helderperez-dev/reavion-driver/issues/2827)) ([ed3c365](https://github.com/helderperez-dev/reavion-driver/commit/ed3c365c954446c774c422e8018541e56155dd6a))
* **reavion-driver:** bound Linux snapshots after app exit ([#2822](https://github.com/helderperez-dev/reavion-driver/issues/2822)) ([d1c5a7a](https://github.com/helderperez-dev/reavion-driver/commit/d1c5a7a90b23a37a18838d9c2122d003d00e7ecf))
* **reavion-driver:** bound Windows app-name lookup ([#2858](https://github.com/helderperez-dev/reavion-driver/issues/2858)) ([2be7aab](https://github.com/helderperez-dev/reavion-driver/commit/2be7aab3de35bdffa9d8ad767471c0699d36d6e5))
* **reavion-driver:** bound Windows installed-app discovery ([#2855](https://github.com/helderperez-dev/reavion-driver/issues/2855)) ([ea971ef](https://github.com/helderperez-dev/reavion-driver/commit/ea971ef06d4ebeda16c6947cb2bca2dd875d2ddc))
* **reavion-driver:** clarify synthetic browser click outcomes ([#2866](https://github.com/helderperez-dev/reavion-driver/issues/2866)) ([197c518](https://github.com/helderperez-dev/reavion-driver/commit/197c518c9c364bd30da8bc076748ea82ed093e27))
* **reavion-driver:** explain permanent scope recovery ([#2857](https://github.com/helderperez-dev/reavion-driver/issues/2857)) ([9110d9f](https://github.com/helderperez-dev/reavion-driver/commit/9110d9fd69c7fda41caab3aaac9df80c87bdab2f))
* **reavion-driver:** fail closed on X11 overlay shape errors ([#1818](https://github.com/helderperez-dev/reavion-driver/issues/1818)) ([0462954](https://github.com/helderperez-dev/reavion-driver/commit/0462954cfb9843ca0cc43f49262acf0e69e3517d))
* **reavion-driver:** hard-bound Windows UIA provider calls ([#2117](https://github.com/helderperez-dev/reavion-driver/issues/2117)) ([c9c6607](https://github.com/helderperez-dev/reavion-driver/commit/c9c660770a26c2f0024b9be1079fac0d4c9effff))
* **reavion-driver:** harden Windows discovery and foreground input ([#2812](https://github.com/helderperez-dev/reavion-driver/issues/2812)) ([441cae0](https://github.com/helderperez-dev/reavion-driver/commit/441cae0d4d4048524ce2f7eeabfb63a6c9a422d3))
* **reavion-driver:** ignore macOS compositor sibling surfaces ([#2908](https://github.com/helderperez-dev/reavion-driver/issues/2908)) ([df57e61](https://github.com/helderperez-dev/reavion-driver/commit/df57e610d3f2e9c07aac59d4896d48656490e1cc))
* **reavion-driver:** keep Windows autostart on the junction path ([#2809](https://github.com/helderperez-dev/reavion-driver/issues/2809)) ([06f0c04](https://github.com/helderperez-dev/reavion-driver/commit/06f0c048fb11b1780e61252eb41a2b968865a8a7))
* **reavion-driver:** keep Windows cursor visible without focus theft ([#2864](https://github.com/helderperez-dev/reavion-driver/issues/2864)) ([2e7a412](https://github.com/helderperez-dev/reavion-driver/commit/2e7a41215ec9e3594567029aad07450c3d731721))
* **reavion-driver:** keep remote debugging enabled when a restart is needed ([#2911](https://github.com/helderperez-dev/reavion-driver/issues/2911)) ([f5b15cc](https://github.com/helderperez-dev/reavion-driver/commit/f5b15cccf6a9f0424dd2d83f730b523c4be21df0))
* **reavion-driver:** launch desktop AppsFolder apps on Windows ([#2862](https://github.com/helderperez-dev/reavion-driver/issues/2862)) ([fb2a6f6](https://github.com/helderperez-dev/reavion-driver/commit/fb2a6f60522ebf132270a3377c9a0496d2c0ba98))
* **reavion-driver:** prevent Linux uinput pointer panics ([#2736](https://github.com/helderperez-dev/reavion-driver/issues/2736)) ([9fde53e](https://github.com/helderperez-dev/reavion-driver/commit/9fde53e1fb190834054eb36e7574bc0b523831e2))
* **reavion-driver:** quiesce idle Wayland overlay ([#2828](https://github.com/helderperez-dev/reavion-driver/issues/2828)) ([35b71a0](https://github.com/helderperez-dev/reavion-driver/commit/35b71a0ebd081c333bf53af6b386ef4798dd05b1))
* **reavion-driver:** refuse minimized Windows element actions ([8a9b7ba](https://github.com/helderperez-dev/reavion-driver/commit/8a9b7baa32bb5b7ea48a1ee6ffc1d87a433405e4))
* **reavion-driver:** repair X11 overlay after display changes ([#2354](https://github.com/helderperez-dev/reavion-driver/issues/2354)) ([81019b5](https://github.com/helderperez-dev/reavion-driver/commit/81019b54b89d577ccb5d7758eba0fd33861fc9d9))
* **reavion-driver:** report honest macOS browser chrome coverage ([#2919](https://github.com/helderperez-dev/reavion-driver/issues/2919)) ([7c52b84](https://github.com/helderperez-dev/reavion-driver/commit/7c52b8449fab36cdda9fe4310e6afd3be202c955))
* **reavion-driver:** report macOS key delivery truthfully ([#2830](https://github.com/helderperez-dev/reavion-driver/issues/2830)) ([3dc0fc0](https://github.com/helderperez-dev/reavion-driver/commit/3dc0fc0e345f6d8107899a18c74245615e294c03))
* **reavion-driver:** report PostMessage pixel fallback truthfully ([4dc537e](https://github.com/helderperez-dev/reavion-driver/commit/4dc537ef34e715c099ab30c7d45618e791da2ad1))
* **reavion-driver:** scope the Linux AT-SPI walk to the requested window ([#2895](https://github.com/helderperez-dev/reavion-driver/issues/2895)) ([8c515ca](https://github.com/helderperez-dev/reavion-driver/commit/8c515ca74d7f9dad2b3ae9d74b59294511824fa1))
* **reavion-driver:** select the correct Linux AT-SPI application tree ([#2740](https://github.com/helderperez-dev/reavion-driver/issues/2740)) ([d86e49b](https://github.com/helderperez-dev/reavion-driver/commit/d86e49ba4bf1c456fd16eca220184a38600ed927))
* **reavion-driver:** stage local installs over a running driver ([#2889](https://github.com/helderperez-dev/reavion-driver/issues/2889)) ([157816e](https://github.com/helderperez-dev/reavion-driver/commit/157816e6144a79162253762b79d0abdfffa8e486))
* **reavion-driver:** stop Windows update --apply from killing itself ([#2805](https://github.com/helderperez-dev/reavion-driver/issues/2805)) ([aebd996](https://github.com/helderperez-dev/reavion-driver/commit/aebd9962d2686e75ff9e17e0a3735e303ff96981))
* **reavion-driver:** verify exact macOS window activation ([#2829](https://github.com/helderperez-dev/reavion-driver/issues/2829)) ([cd5c6f3](https://github.com/helderperez-dev/reavion-driver/commit/cd5c6f3ec5c2f71a8fbc64563d42933d381008ba))


### Performance Improvements

* **reavion-driver:** accelerate Linux X11 capture with MIT-SHM ([#2796](https://github.com/helderperez-dev/reavion-driver/issues/2796)) ([5448c44](https://github.com/helderperez-dev/reavion-driver/commit/5448c449c81c81a7e48a418f8276d257f0e4c563))
* **reavion-driver:** accelerate macOS window capture with ScreenCaptureKit ([#2795](https://github.com/helderperez-dev/reavion-driver/issues/2795)) ([bc90373](https://github.com/helderperez-dev/reavion-driver/commit/bc90373362cb7c521b1ff03f94457d5de618095c))

## [0.17.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.16.0...reavion-driver-rs-v0.17.0) (2026-08-02)


### ⚠ BREAKING CHANGES

* **reavion-driver:** make native desktop actions snapshot-safe ([#2783](https://github.com/helderperez-dev/reavion-driver/issues/2783))

### Features

* **reavion-driver:** make native desktop actions snapshot-safe ([#2783](https://github.com/helderperez-dev/reavion-driver/issues/2783)) ([d8ae6df](https://github.com/helderperez-dev/reavion-driver/commit/d8ae6df643df5049505a327b88abc2644a25b209))
* **reavion-driver:** make native selection and editing foreground-safe ([#2789](https://github.com/helderperez-dev/reavion-driver/issues/2789)) ([815013a](https://github.com/helderperez-dev/reavion-driver/commit/815013a88c02d2c8c3e40f98d41fac84f037f91d))


### Bug Fixes

* **reavion-driver:** focus exact target for native menus ([#2788](https://github.com/helderperez-dev/reavion-driver/issues/2788)) ([2269fa3](https://github.com/helderperez-dev/reavion-driver/commit/2269fa352a801bcf1505ac3af8b125db742a4b82))

## [0.16.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.15.0...reavion-driver-rs-v0.16.0) (2026-08-01)


### Features

* **reavion-driver:** add verified semantic window framing ([#2772](https://github.com/helderperez-dev/reavion-driver/issues/2772)) ([fb39144](https://github.com/helderperez-dev/reavion-driver/commit/fb3914475b9cba97376a6b9b739077cc0994d15f))


### Bug Fixes

* **reavion-driver:** prefer semantic routes before GUI fallback ([6f2faf9](https://github.com/helderperez-dev/reavion-driver/commit/6f2faf9f9c0ea2db3d0b731d45c6d80a9de23db5))

## [0.15.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.14.2...reavion-driver-rs-v0.15.0) (2026-08-01)


### ⚠ BREAKING CHANGES

* **reavion-driver:** standardize action results ([#2713](https://github.com/helderperez-dev/reavion-driver/issues/2713))

### Features

* **reavion-driver:** add checked state verification ([#2705](https://github.com/helderperez-dev/reavion-driver/issues/2705)) ([84440dd](https://github.com/helderperez-dev/reavion-driver/commit/84440ddc6d42accb629f2289012241ed512e1aea))
* **reavion-driver:** add clipboard read and write primitives ([#2764](https://github.com/helderperez-dev/reavion-driver/issues/2764)) ([b8fb6d1](https://github.com/helderperez-dev/reavion-driver/commit/b8fb6d1218d84ea1806ebce2dec5f22edda29c21))
* **reavion-driver:** standardize action results ([#2713](https://github.com/helderperez-dev/reavion-driver/issues/2713)) ([8e0a92e](https://github.com/helderperez-dev/reavion-driver/commit/8e0a92e3dbf20134be9922f9e0dc847addcc92fa))


### Bug Fixes

* **reavion-driver:** bound macOS capture permission probe ([#2761](https://github.com/helderperez-dev/reavion-driver/issues/2761)) ([14b790f](https://github.com/helderperez-dev/reavion-driver/commit/14b790f766fe177aa047c88975e301a49a17cc4c))
* **reavion-driver:** define list_windows z-index contract ([#2768](https://github.com/helderperez-dev/reavion-driver/issues/2768)) ([5fe669f](https://github.com/helderperez-dev/reavion-driver/commit/5fe669ff43897f305aacb2442d8c5084607daf66))
* **reavion-driver:** index writable native value controls ([46fc5cb](https://github.com/helderperez-dev/reavion-driver/commit/46fc5cb7c2b477ba3194a792580dab4a595a5ec5))
* **reavion-driver:** open Finder folder URLs reliably ([13057dc](https://github.com/helderperez-dev/reavion-driver/commit/13057dc6c8c08da71b8e06a63831ccb5b6870bc5))
* **reavion-driver:** preserve verified selection readbacks ([dc0af9b](https://github.com/helderperez-dev/reavion-driver/commit/dc0af9b23ca8d866540b9ed2b4e4ad7b8b0c4ffb))
* **reavion-driver:** reject ambiguous PID-only targets ([#2763](https://github.com/helderperez-dev/reavion-driver/issues/2763)) ([5b95f2a](https://github.com/helderperez-dev/reavion-driver/commit/5b95f2a888b84f1e892635b20484b69d27122630))
* **reavion-driver:** reject concurrent text input per process ([#2762](https://github.com/helderperez-dev/reavion-driver/issues/2762)) ([07d1242](https://github.com/helderperez-dev/reavion-driver/commit/07d124258d83c2a53b0739463a925eaa3477066b))
* **reavion-driver:** select macOS collection items reliably ([4be90ea](https://github.com/helderperez-dev/reavion-driver/commit/4be90ea11345535decb1baacde14c0313338f1c6))

## [0.14.2](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.14.1...reavion-driver-rs-v0.14.2) (2026-07-31)


### Bug Fixes

* **reavion-driver:** preserve Screen Sharing keyboard input ([#2698](https://github.com/helderperez-dev/reavion-driver/issues/2698)) ([61b1a84](https://github.com/helderperez-dev/reavion-driver/commit/61b1a84c9ede937fcc3f0c8a78aa78ac79d1421e))
* **reavion-driver:** reconcile macOS launch readiness ([#2697](https://github.com/helderperez-dev/reavion-driver/issues/2697)) ([771e016](https://github.com/helderperez-dev/reavion-driver/commit/771e0165e7ecd2566cbb17b793a863755a8d651f))

## [0.14.1](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.14.0...reavion-driver-rs-v0.14.1) (2026-07-29)


### Bug Fixes

* **reavion-driver:** advance installers only after release publication ([dad42d1](https://github.com/helderperez-dev/reavion-driver/commit/dad42d1932d9683a78b344bad6f058944446a59a))
* **reavion-driver:** fall back to the releases API when the baked version has no assets ([1be9c7e](https://github.com/helderperez-dev/reavion-driver/commit/1be9c7ed0d9aa7b6756727726350a39a6160c3d8))

## [0.14.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.13.1...reavion-driver-rs-v0.14.0) (2026-07-29)


### ⚠ BREAKING CHANGES

* **reavion-driver:** move cursor context into session badges ([#2677](https://github.com/helderperez-dev/reavion-driver/issues/2677))

### Features

* **reavion-driver:** move cursor context into session badges ([#2677](https://github.com/helderperez-dev/reavion-driver/issues/2677)) ([11c4647](https://github.com/helderperez-dev/reavion-driver/commit/11c4647128a99b2879f31a3f4eedc6b08d52c079))


### Bug Fixes

* **reavion-driver:** avoid starting Orca on COSMIC ([#2666](https://github.com/helderperez-dev/reavion-driver/issues/2666)) ([069272e](https://github.com/helderperez-dev/reavion-driver/commit/069272e0b97114559f2edc22e06b2f9cf5847847))
* **reavion-driver:** declare browser chrome capture coverage ([#2599](https://github.com/helderperez-dev/reavion-driver/issues/2599)) ([a36865c](https://github.com/helderperez-dev/reavion-driver/commit/a36865c236e7b70f67d974fb80e2b0119929b636))
* **reavion-driver:** keep cursor badges and drags in sync ([#2676](https://github.com/helderperez-dev/reavion-driver/issues/2676)) ([b249df8](https://github.com/helderperez-dev/reavion-driver/commit/b249df857994ebaebf9f02248e8312b3bd2a5dd2))
* **reavion-driver:** refine session cursor feedback ([#2665](https://github.com/helderperez-dev/reavion-driver/issues/2665)) ([d366af0](https://github.com/helderperez-dev/reavion-driver/commit/d366af084e5357a570891fcf2c77c14811d9b617))

## [0.13.1](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.12.6...reavion-driver-rs-v0.13.1) (2026-07-28)


### ⚠ BREAKING CHANGES

* **reavion-driver:** simplify permissions and add session identity ([#2616](https://github.com/helderperez-dev/reavion-driver/issues/2616))
* **reavion-driver:** ship semantic cursor themes
* **reavion-driver:** replace language MCP clients with Rust SDKs ([#2341](https://github.com/helderperez-dev/reavion-driver/issues/2341))

### Features

* **reavion-driver/macos:** implement page click_element + fix Chromium window targeting ([#2082](https://github.com/helderperez-dev/reavion-driver/issues/2082)) ([73fe822](https://github.com/helderperez-dev/reavion-driver/commit/73fe8227982c0b03795669e4cdf62384f0d54a34))
* **reavion-driver:** add aggregate agent session telemetry ([aa41707](https://github.com/helderperez-dev/reavion-driver/commit/aa417076c7d31df9d78dc72e982b48b5506e1695))
* **reavion-driver:** add aggregate agent session telemetry ([3a59246](https://github.com/helderperez-dev/reavion-driver/commit/3a5924640738e9881efc11a80b6e26ed6ef5ed0a))
* **reavion-driver:** add bounded feature telemetry ([4972560](https://github.com/helderperez-dev/reavion-driver/commit/4972560226ea3ff81c5d07ca3e867fbaa5238f69))
* **reavion-driver:** add bounded feature telemetry ([ebfb4eb](https://github.com/helderperez-dev/reavion-driver/commit/ebfb4eb7fa48e028d4a64ec94ddda2f466d8313d))
* **reavion-driver:** add browser dialogs and uploads ([21ca689](https://github.com/helderperez-dev/reavion-driver/commit/21ca68928e546103a59ad851699a50e543ff601b))
* **reavion-driver:** add browser telemetry contract ([fa13890](https://github.com/helderperez-dev/reavion-driver/commit/fa138903f779b33b4c8512c7d64bb960023161fe))
* **reavion-driver:** add browser telemetry contract ([#2310](https://github.com/helderperez-dev/reavion-driver/issues/2310)) ([763a6ea](https://github.com/helderperez-dev/reavion-driver/commit/763a6ea21b86ad5f8a70ab2581edee1dd7370efa))
* **reavion-driver:** add capability-aware browser tools ([#2257](https://github.com/helderperez-dev/reavion-driver/issues/2257)) ([0835daa](https://github.com/helderperez-dev/reavion-driver/commit/0835daa6d415c857c1d3ebefe2c29453a0bed923))
* **reavion-driver:** add client and modality telemetry ([#2441](https://github.com/helderperez-dev/reavion-driver/issues/2441)) ([5cd0000](https://github.com/helderperez-dev/reavion-driver/commit/5cd0000e2e018a835303a8f8bdd82a88ea483a6e))
* **reavion-driver:** add local consent UI and complete Wayland certification ([#2597](https://github.com/helderperez-dev/reavion-driver/issues/2597)) ([e9852cb](https://github.com/helderperez-dev/reavion-driver/commit/e9852cb68494e9f521c7734206f638773dbc3299))
* **reavion-driver:** add persistent macOS interactive input sessions ([2dad3e5](https://github.com/helderperez-dev/reavion-driver/commit/2dad3e519e17b27eaa793151b8671957f578072c))
* **reavion-driver:** add protected permission modes and consent grants ([#2383](https://github.com/helderperez-dev/reavion-driver/issues/2383)) ([c75e606](https://github.com/helderperez-dev/reavion-driver/commit/c75e60636c11e21ef44f1ebbe1c1350339bae295))
* **reavion-driver:** add Rust-owned embedded host for SDK and MCP ([#2427](https://github.com/helderperez-dev/reavion-driver/issues/2427)) ([5016dc1](https://github.com/helderperez-dev/reavion-driver/commit/5016dc16bfe54c165e6678104ec521a6d85f76db))
* **reavion-driver:** add semantic browser snapshots ([1a9fbb4](https://github.com/helderperez-dev/reavion-driver/commit/1a9fbb480605f72c449d2c741c19ae32ed5659d8))
* **reavion-driver:** add semantic browser snapshots ([#2301](https://github.com/helderperez-dev/reavion-driver/issues/2301)) ([e83d2d3](https://github.com/helderperez-dev/reavion-driver/commit/e83d2d3d6142fee78edca6352790db4336abacbb))
* **reavion-driver:** add stable health_report MCP tool for end-to-end driver diagnostics ([be761fa](https://github.com/helderperez-dev/reavion-driver/commit/be761fac796d3f266d56ed7ce89c5a5ff6a89eac))
* **reavion-driver:** add true in-process SDK runtime ([#2461](https://github.com/helderperez-dev/reavion-driver/issues/2461)) ([617508a](https://github.com/helderperez-dev/reavion-driver/commit/617508a7ae123f277b203d31fca29933927a4636))
* **reavion-driver:** add versioned native ABI ([b172afc](https://github.com/helderperez-dev/reavion-driver/commit/b172afc75f39832a4bdfaa9040d6d4f556449b49))
* **reavion-driver:** browser_type can replace a field's content, not only append ([#2624](https://github.com/helderperez-dev/reavion-driver/issues/2624)) ([eb0b5a0](https://github.com/helderperez-dev/reavion-driver/commit/eb0b5a0c72cd1203e1dcaab768cdf37c33868302))
* **reavion-driver:** capture inactive tabs and retain modal controls ([#2426](https://github.com/helderperez-dev/reavion-driver/issues/2426)) ([c4d7ddc](https://github.com/helderperez-dev/reavion-driver/commit/c4d7ddc5bc7c00faf3e9102bee664ea47b2f5fac))
* **reavion-driver:** centralize protected resource grants per runtime ([#2577](https://github.com/helderperez-dev/reavion-driver/issues/2577)) ([dfb3781](https://github.com/helderperez-dev/reavion-driver/commit/dfb3781460f04f9b523871b2f478233a59e5d364))
* **reavion-driver:** complete browser mutations ([b4007a8](https://github.com/helderperez-dev/reavion-driver/commit/b4007a8442d3f3238226b5d5d11feda8da13c0af))
* **reavion-driver:** complete telemetry lifecycle coverage ([f06b7cf](https://github.com/helderperez-dev/reavion-driver/commit/f06b7cf26f44721edd968f1dd072eb395212dd10))
* **reavion-driver:** complete telemetry lifecycle coverage ([7ac5836](https://github.com/helderperez-dev/reavion-driver/commit/7ac5836714e99f945e13e840d400f0a637edf56d))
* **reavion-driver:** complete the browser action surface ([#2323](https://github.com/helderperez-dev/reavion-driver/issues/2323)) ([01a9505](https://github.com/helderperez-dev/reavion-driver/commit/01a9505aeac5d2a3afc57a7b1ce98523b58929ae))
* **reavion-driver:** desktop-scope Phase 1 — capture_scope config, get_desktop_state, Windows screen-absolute actions ([#1968](https://github.com/helderperez-dev/reavion-driver/issues/1968)) ([#2019](https://github.com/helderperez-dev/reavion-driver/issues/2019)) ([fc27185](https://github.com/helderperez-dev/reavion-driver/commit/fc271854149771adbb9f2e71ad64e58de5087de7))
* **reavion-driver:** embedded mode — inherit the host app's TCC grants, never prompt ([#2102](https://github.com/helderperez-dev/reavion-driver/issues/2102)) ([b654f27](https://github.com/helderperez-dev/reavion-driver/commit/b654f27d609ecbac22ea63a000c868c90c0ee44d))
* **reavion-driver:** enforce consequential and privileged actions ([#2585](https://github.com/helderperez-dev/reavion-driver/issues/2585)) ([df368a7](https://github.com/helderperez-dev/reavion-driver/commit/df368a7698a07ec9ba7e10952d483457c22841ff))
* **reavion-driver:** enforce desktop input grants ([#2580](https://github.com/helderperez-dev/reavion-driver/issues/2580)) ([2b5e938](https://github.com/helderperez-dev/reavion-driver/commit/2b5e938d7014ccdced5abe6d1c4d493063f67b56))
* **reavion-driver:** enforce exact file transfer grants ([#2581](https://github.com/helderperez-dev/reavion-driver/issues/2581)) ([3f74894](https://github.com/helderperez-dev/reavion-driver/commit/3f748946ecc176d2d7a71add246c5647acca2be3))
* **reavion-driver:** enforce private observation grants ([#2579](https://github.com/helderperez-dev/reavion-driver/issues/2579)) ([6052381](https://github.com/helderperez-dev/reavion-driver/commit/6052381e97446cca3338221eb888c49e57356890))
* **reavion-driver:** expose macOS control state in window elements ([db281a3](https://github.com/helderperez-dev/reavion-driver/commit/db281a3b0d9bbabaf74f3c6847adf6abbb66995a))
* **reavion-driver:** expose trusted protected-consent hosts ([#2578](https://github.com/helderperez-dev/reavion-driver/issues/2578)) ([fd4069e](https://github.com/helderperez-dev/reavion-driver/commit/fd4069ec6de49e9fa499e3057e874b9dae1d9665))
* **reavion-driver:** fall back to key events when type-target is a terminal ([687d908](https://github.com/helderperez-dev/reavion-driver/commit/687d908f5efe19ddfd0915f6e654ffb9118bea01))
* **reavion-driver:** implement SDK-owned runtime RFC ([#2561](https://github.com/helderperez-dev/reavion-driver/issues/2561)) ([1760f25](https://github.com/helderperez-dev/reavion-driver/commit/1760f253d3c4d76618a8c97a04f2c100ffc491ac))
* **reavion-driver:** make permission adapter inventory mode-aware ([#2576](https://github.com/helderperez-dev/reavion-driver/issues/2576)) ([83a2f6f](https://github.com/helderperez-dev/reavion-driver/commit/83a2f6fad7b2f3349be40433e343cd8f934495eb))
* **reavion-driver:** make SDK-owned runtime the default ([#2545](https://github.com/helderperez-dev/reavion-driver/issues/2545)) ([a62e821](https://github.com/helderperez-dev/reavion-driver/commit/a62e8219255f15f6ed747c03337198d6fe32912f))
* **reavion-driver:** prepare ClawHub skill release ([#2265](https://github.com/helderperez-dev/reavion-driver/issues/2265)) ([393c984](https://github.com/helderperez-dev/reavion-driver/commit/393c984190b22543ed0d83ce457e7bfec0653492))
* **reavion-driver:** replace language MCP clients with Rust SDKs ([#2341](https://github.com/helderperez-dev/reavion-driver/issues/2341)) ([b8a0f32](https://github.com/helderperez-dev/reavion-driver/commit/b8a0f32a06c75225ba24ebb5ab14f6507fa90d15))
* **reavion-driver:** ship semantic cursor themes ([e06e922](https://github.com/helderperez-dev/reavion-driver/commit/e06e9229ba65529f1594b11a6834cc2738117045))
* **reavion-driver:** ship vector semantic cursor themes ([#2603](https://github.com/helderperez-dev/reavion-driver/issues/2603)) ([e2c52d5](https://github.com/helderperez-dev/reavion-driver/commit/e2c52d50ba331798a3da4871fdad3bbcdd399633))
* **reavion-driver:** simplify permissions and add session identity ([#2616](https://github.com/helderperez-dev/reavion-driver/issues/2616)) ([8dac16e](https://github.com/helderperez-dev/reavion-driver/commit/8dac16e2c22a24687983e0e169a4dc2329e6cadb))
* **reavion-driver:** standardize computer action telemetry ([#2318](https://github.com/helderperez-dev/reavion-driver/issues/2318)) ([9a29c8d](https://github.com/helderperez-dev/reavion-driver/commit/9a29c8dde15591713ddf8657050201894da3c2d8))
* **reavion-driver:** support approved existing browser profiles ([#2261](https://github.com/helderperez-dev/reavion-driver/issues/2261)) ([8582630](https://github.com/helderperez-dev/reavion-driver/commit/8582630ca8f4d2d8ca0315d19dc5073b81a0fed9))
* **reavion-driver:** support multiple direct runtimes per process ([#2575](https://github.com/helderperez-dev/reavion-driver/issues/2575)) ([5f786b0](https://github.com/helderperez-dev/reavion-driver/commit/5f786b058162bc69caacaa00c05f6fcca85d9d3d))
* **reavion-driver:** track update funnel telemetry ([#2392](https://github.com/helderperez-dev/reavion-driver/issues/2392)) ([994308a](https://github.com/helderperez-dev/reavion-driver/commit/994308a96649109c4e6334acba7179acc8542155))
* **reavion-driver:** unify tool telemetry ownership ([1435e84](https://github.com/helderperez-dev/reavion-driver/commit/1435e84a24f3d8de442091a37c229176faa2aba4))
* **reavion-driver:** unify tool telemetry ownership ([ccdace9](https://github.com/helderperez-dev/reavion-driver/commit/ccdace9e7f6c01e08432e91e6eb8c882981c4d05))
* **reavion-driver:** window-less desktop-scope click — macOS + Linux (unified interface) ([#2056](https://github.com/helderperez-dev/reavion-driver/issues/2056)) ([af2255c](https://github.com/helderperez-dev/reavion-driver/commit/af2255c78ba86dfdbdd49e1ce09e42b5101080b1))
* **driver:** add per-session capture scope ([#2329](https://github.com/helderperez-dev/reavion-driver/issues/2329)) ([db0ee87](https://github.com/helderperez-dev/reavion-driver/commit/db0ee870c200b5acc9a6542eabc84dc674b729c7))
* **driver:** add YAML and Rego permission policies ([#2235](https://github.com/helderperez-dev/reavion-driver/issues/2235)) ([afb25d7](https://github.com/helderperez-dev/reavion-driver/commit/afb25d740ba7f5b7bfd9970aee7b02919b10eb6e))
* **platform-linux:** native-Wayland parity (wlroots + portal + libei) ([#1966](https://github.com/helderperez-dev/reavion-driver/issues/1966)) ([519dfdf](https://github.com/helderperez-dev/reavion-driver/commit/519dfdfbd6c7cf8e10fa860b15201f84da73eb57))
* **release:** automate Driver and Lume attribution ([#2267](https://github.com/helderperez-dev/reavion-driver/issues/2267)) ([5019927](https://github.com/helderperez-dev/reavion-driver/commit/50199272cff60b11df0374dd26db365338be5744))
* **skills:** autodetect Hermes (NousResearch/hermes-agent) at ~/.hermes/skills ([#1963](https://github.com/helderperez-dev/reavion-driver/issues/1963)) ([9d90c81](https://github.com/helderperez-dev/reavion-driver/commit/9d90c815d31827f64a09d94c1d32d22c327f2770))
* **test-harness:** Linux GTK3 harness app + test (parity with macOS/Windows) ([#2050](https://github.com/helderperez-dev/reavion-driver/issues/2050)) ([aaa3f4c](https://github.com/helderperez-dev/reavion-driver/commit/aaa3f4c4ad0b88fda5f51763a200bb32863a96cd))


### Bug Fixes

* **reavion-driver-rs:** feature-gate portal+libei so bullseye CD publishes v0.6.1 ([#1967](https://github.com/helderperez-dev/reavion-driver/issues/1967)) ([5061c11](https://github.com/helderperez-dev/reavion-driver/commit/5061c11b3aa51f596f63838f87a2dca1991aa545))
* **reavion-driver/install.ps1:** resolve a valid temp dir when $env:TEMP is a missing 8.3 short path ([#1911](https://github.com/helderperez-dev/reavion-driver/issues/1911)) ([#1990](https://github.com/helderperez-dev/reavion-driver/issues/1990)) ([8395169](https://github.com/helderperez-dev/reavion-driver/commit/8395169dbe1c19a17ab4320a8e91066b1c9eefbf))
* **reavion-driver/linux:** auto-discover XAUTHORITY for SSH-driven Wayland+Xwayland ([#1926](https://github.com/helderperez-dev/reavion-driver/issues/1926)) ([#1999](https://github.com/helderperez-dev/reavion-driver/issues/1999)) ([9091a30](https://github.com/helderperez-dev/reavion-driver/commit/9091a30fb4663dcadb65cdf800de774325c2deff))
* **reavion-driver/linux:** bound X11 overlay render work ([#2331](https://github.com/helderperez-dev/reavion-driver/issues/2331)) ([428d7aa](https://github.com/helderperez-dev/reavion-driver/commit/428d7aa5364401c842a5e1428ba3b9ad7009e051))
* **reavion-driver/linux:** fail loudly when X11 input can't be delivered on pure Wayland ([#1921](https://github.com/helderperez-dev/reavion-driver/issues/1921)) ([#1994](https://github.com/helderperez-dev/reavion-driver/issues/1994)) ([7c1d06b](https://github.com/helderperez-dev/reavion-driver/commit/7c1d06bf19d224e4690b6a537e85361cce8c81bb))
* **reavion-driver/linux:** get_desktop_state screen size on pure Wayland ([#2047](https://github.com/helderperez-dev/reavion-driver/issues/2047)) ([6b2b262](https://github.com/helderperez-dev/reavion-driver/commit/6b2b2629debb2b19c57d0c0b2abdaf216ea41d3e))
* **reavion-driver/linux:** glide the agent cursor to the desktop-scope click point ([#2061](https://github.com/helderperez-dev/reavion-driver/issues/2061)) ([7468487](https://github.com/helderperez-dev/reavion-driver/commit/7468487d303469b4993b960c8a2cb66289034bed))
* **reavion-driver/linux:** remap a spare keycode for keysyms absent from the X keymap ([#2048](https://github.com/helderperez-dev/reavion-driver/issues/2048)) ([a139668](https://github.com/helderperez-dev/reavion-driver/commit/a139668f1c87b12bc2ce9a2d2c600252331557d9))
* **reavion-driver/linux:** report dead input backend on KDE/GNOME Wayland instead of silent no-op ([#1982](https://github.com/helderperez-dev/reavion-driver/issues/1982)) ([#1992](https://github.com/helderperez-dev/reavion-driver/issues/1992)) ([3aff226](https://github.com/helderperez-dev/reavion-driver/commit/3aff22663a6409ecca1a42353ebbac3455256237))
* **reavion-driver/linux:** retry root-only AT-SPI tree on cold Qt6 launch ([#1927](https://github.com/helderperez-dev/reavion-driver/issues/1927)) ([#1998](https://github.com/helderperez-dev/reavion-driver/issues/1998)) ([b64af30](https://github.com/helderperez-dev/reavion-driver/commit/b64af303f2f844f20e5de1d10214d6123bf7f680))
* **reavion-driver/linux:** return structured launch_app result ([#2091](https://github.com/helderperez-dev/reavion-driver/issues/2091)) ([c0c6790](https://github.com/helderperez-dev/reavion-driver/commit/c0c67908167f3d0532683b005ad26659dcab8a34))
* **reavion-driver/macos:** set_config accepts {key,value} shape (parity with Win/Linux) ([#2059](https://github.com/helderperez-dev/reavion-driver/issues/2059)) ([3def0d7](https://github.com/helderperez-dev/reavion-driver/commit/3def0d79df66b8a9d0b4dfeb71201ddebe672a1d))
* **reavion-driver/windows:** retry transient BuildUpdatedCache failures instead of returning elements=0 ([#1881](https://github.com/helderperez-dev/reavion-driver/issues/1881)) ([#1996](https://github.com/helderperez-dev/reavion-driver/issues/1996)) ([7518f37](https://github.com/helderperez-dev/reavion-driver/commit/7518f37a3222761e4a3e391f0516c9ae8fe7fa34))
* **reavion-driver/windows:** route DoubleClick/RightClick on Chromium targets via SendInput ([#1984](https://github.com/helderperez-dev/reavion-driver/issues/1984)) ([#1995](https://github.com/helderperez-dev/reavion-driver/issues/1995)) ([26d9298](https://github.com/helderperez-dev/reavion-driver/commit/26d9298e03cc2d6df5d470e9a3707eb21adde398))
* **reavion-driver:** accept letter keys on Windows ([#2551](https://github.com/helderperez-dev/reavion-driver/issues/2551)) ([506a4ed](https://github.com/helderperez-dev/reavion-driver/commit/506a4ede22dfe791b3630640bc0c24e0f03c6d96))
* **reavion-driver:** activate Chromium checkboxes safely on Linux ([#2633](https://github.com/helderperez-dev/reavion-driver/issues/2633)) ([1f16242](https://github.com/helderperez-dev/reavion-driver/commit/1f16242750df58b6af4b7b44f4f3a317a66a4bb1))
* **reavion-driver:** advertise delivery mode capability ([7f6657c](https://github.com/helderperez-dev/reavion-driver/commit/7f6657c440cedf1f20c6307c849a89487f867b41)), closes [#2425](https://github.com/helderperez-dev/reavion-driver/issues/2425)
* **reavion-driver:** avoid leaking XInput masters without uinput ([36e8d5a](https://github.com/helderperez-dev/reavion-driver/commit/36e8d5ad480096d0e5b576912674bdc3b9a89267))
* **reavion-driver:** avoid opaque X11 cursor bloom ([#2328](https://github.com/helderperez-dev/reavion-driver/issues/2328)) ([e57fed5](https://github.com/helderperez-dev/reavion-driver/commit/e57fed576afba793db756d0b54e6ff6dde3387d6))
* **reavion-driver:** avoid SIGCHLD handler in doctor ([31bbc07](https://github.com/helderperez-dev/reavion-driver/commit/31bbc074d75f59fe2c417cddc66cf4093bd8330b)), closes [#2348](https://github.com/helderperez-dev/reavion-driver/issues/2348)
* **reavion-driver:** bind macOS state and actions to requested windows ([#2645](https://github.com/helderperez-dev/reavion-driver/issues/2645)) ([729c4da](https://github.com/helderperez-dev/reavion-driver/commit/729c4da91fcb5d5aac85348d09e642a7929c59c8))
* **reavion-driver:** bound tool telemetry volume ([#2382](https://github.com/helderperez-dev/reavion-driver/issues/2382)) ([99d4d61](https://github.com/helderperez-dev/reavion-driver/commit/99d4d613abc35a67753d206fcf3371673fb75edd))
* **reavion-driver:** carry full 32-bit snapshot generation in element tokens ([#2608](https://github.com/helderperez-dev/reavion-driver/issues/2608)) ([fcac692](https://github.com/helderperez-dev/reavion-driver/commit/fcac692b6d6531a32f3ebc5d7a9ba675d90ec86a))
* **reavion-driver:** clarify foreground escalation guidance ([b4f6ffc](https://github.com/helderperez-dev/reavion-driver/commit/b4f6ffca79b4f746e28b30eaa041c534704ee372))
* **reavion-driver:** classify health_report as read-only diagnostics ([#2408](https://github.com/helderperez-dev/reavion-driver/issues/2408)) ([16e7573](https://github.com/helderperez-dev/reavion-driver/commit/16e7573363adaf3cb6abcfbe8ebf04b7172ff160)), closes [#2399](https://github.com/helderperez-dev/reavion-driver/issues/2399)
* **reavion-driver:** declare WinRects support for GNOME Shell 49 and 50 ([#2565](https://github.com/helderperez-dev/reavion-driver/issues/2565)) ([776dadd](https://github.com/helderperez-dev/reavion-driver/commit/776daddcbc7dba345343f0e0f709bd9c486ec087))
* **reavion-driver:** deliver background browser keystrokes ([a7b7413](https://github.com/helderperez-dev/reavion-driver/commit/a7b741317c86ccd3b1241421e411137f87115eb8))
* **reavion-driver:** deliver foreground pixel hotkeys through HID ([#2464](https://github.com/helderperez-dev/reavion-driver/issues/2464)) ([bc1a58d](https://github.com/helderperez-dev/reavion-driver/commit/bc1a58d7926fadbc79b7d2925895878b9ab81cda))
* **reavion-driver:** deliver trusted background browser clicks ([00f33c4](https://github.com/helderperez-dev/reavion-driver/commit/00f33c4cfaff223a0ade812bb16f4cdb16419d87))
* **reavion-driver:** diagnose stale local MCP registrations ([#2498](https://github.com/helderperez-dev/reavion-driver/issues/2498)) ([df10b6d](https://github.com/helderperez-dev/reavion-driver/commit/df10b6d3d4b194a714656d3d8758db5017234de0))
* **reavion-driver:** distinguish autostart query failures ([#2345](https://github.com/helderperez-dev/reavion-driver/issues/2345)) ([0b798a5](https://github.com/helderperez-dev/reavion-driver/commit/0b798a59cbe7f9e628ae488cb8023b9b6f990bd6))
* **reavion-driver:** distrust web keystroke AX read-back ([c81d69b](https://github.com/helderperez-dev/reavion-driver/commit/c81d69b87e33c2677b42a8d957f534fba379fd58))
* **reavion-driver:** don't treat socket read-timeout (EAGAIN) as fatal in daemon proxy ([#1864](https://github.com/helderperez-dev/reavion-driver/issues/1864)) ([#1997](https://github.com/helderperez-dev/reavion-driver/issues/1997)) ([b651461](https://github.com/helderperez-dev/reavion-driver/commit/b651461eae8f44083e6d7e1257a4aa1031a05581))
* **reavion-driver:** enforce authorization in embedded SDK ([#2542](https://github.com/helderperez-dev/reavion-driver/issues/2542)) ([06bda89](https://github.com/helderperez-dev/reavion-driver/commit/06bda89f078e882a64ecccb78700ff26dc4d210f))
* **reavion-driver:** enforce scope for mouse button actions ([caa241b](https://github.com/helderperez-dev/reavion-driver/commit/caa241be5f801e2060d4f5823fde64f9e6dc2be4)), closes [#2368](https://github.com/helderperez-dev/reavion-driver/issues/2368)
* **reavion-driver:** expose skill install failure details ([#2510](https://github.com/helderperez-dev/reavion-driver/issues/2510)) ([d614d8d](https://github.com/helderperez-dev/reavion-driver/commit/d614d8db689cd663f9e8d784ff03ac1bd388f506))
* **reavion-driver:** fail closed for unsupported browser and Wayland routes ([2b06a78](https://github.com/helderperez-dev/reavion-driver/commit/2b06a782544e9fc742bf2e90c80d65d9b5c6f721))
* **reavion-driver:** gate Windows overlay compositing to real pixel changes ([#2558](https://github.com/helderperez-dev/reavion-driver/issues/2558)) ([d7c1609](https://github.com/helderperez-dev/reavion-driver/commit/d7c1609345ab6383e2447a97fbac05a3338e5bc7))
* **reavion-driver:** harden browser preview boundaries ([48e2e7b](https://github.com/helderperez-dev/reavion-driver/commit/48e2e7ba8457ca9262cbe17b304f87c7d1b577ac))
* **reavion-driver:** harden browser preview boundaries ([667646a](https://github.com/helderperez-dev/reavion-driver/commit/667646af2d6391d419ff2169e7b4ea3e8d7c9ffc))
* **reavion-driver:** harden browser scroll and endpoint proof ([1041383](https://github.com/helderperez-dev/reavion-driver/commit/10413835ba9036f9435caa167915b255eecef2ec))
* **reavion-driver:** harden browser scroll and endpoint proof ([7510ed9](https://github.com/helderperez-dev/reavion-driver/commit/7510ed9c1f82f66c758e6d02e755350d705cacd5))
* **reavion-driver:** harden exact-profile browser attachment across Chrome and Edge ([2b06a78](https://github.com/helderperez-dev/reavion-driver/commit/2b06a782544e9fc742bf2e90c80d65d9b5c6f721))
* **reavion-driver:** harden existing browser attachment ([2ccb87c](https://github.com/helderperez-dev/reavion-driver/commit/2ccb87c8a9cbcaabc428243c8e7fbe809ac63709))
* **reavion-driver:** harden GNOME 50 Shell capture ([#2226](https://github.com/helderperez-dev/reavion-driver/issues/2226)) ([d250e53](https://github.com/helderperez-dev/reavion-driver/commit/d250e532dbf5fdc28df0e5f1ec6b3209f846a838))
* **reavion-driver:** harden Linux AT-SPI and input delivery ([3c63d71](https://github.com/helderperez-dev/reavion-driver/commit/3c63d712a5eab52103112cfab86fc2ca842442a3))
* **reavion-driver:** harden Linux AT-SPI and input delivery ([ea599fd](https://github.com/helderperez-dev/reavion-driver/commit/ea599fdfd76f49f94a3fc4ddb5486dca68a3fbc4))
* **reavion-driver:** harden macOS browser profile setup ([e6643f2](https://github.com/helderperez-dev/reavion-driver/commit/e6643f21e56e7fcee90c503f8fd39c7659d83b43))
* **reavion-driver:** harden macOS input and capture delivery ([4e1aab4](https://github.com/helderperez-dev/reavion-driver/commit/4e1aab42ca4dba143aed20da72878a0ec4290739))
* **reavion-driver:** harden macOS input and capture delivery ([ec908f7](https://github.com/helderperez-dev/reavion-driver/commit/ec908f74cb9f89cb6dbb7af14c18ff71105bd75a))
* **reavion-driver:** harden telemetry release paths ([#2214](https://github.com/helderperez-dev/reavion-driver/issues/2214)) ([06fcc0f](https://github.com/helderperez-dev/reavion-driver/commit/06fcc0fb3bdf5d111069525d146dcb5aa2050e1b))
* **reavion-driver:** harden Windows delivery and GUI validation ([5007f85](https://github.com/helderperez-dev/reavion-driver/commit/5007f85a37b4e29fea1d34c3fcc4590dd21f1e99))
* **reavion-driver:** harden Windows delivery and GUI validation ([3c5c4c1](https://github.com/helderperez-dev/reavion-driver/commit/3c5c4c13552e349653e4d62e1f03e172e5cd5faa))
* **reavion-driver:** honor Cargo target dir in local installs ([#2486](https://github.com/helderperez-dev/reavion-driver/issues/2486)) ([7cb6810](https://github.com/helderperez-dev/reavion-driver/commit/7cb6810b429ec9723c9e2050d6670340eeda4265))
* **reavion-driver:** isolate Wayland portal connections ([#2552](https://github.com/helderperez-dev/reavion-driver/issues/2552)) ([074ec16](https://github.com/helderperez-dev/reavion-driver/commit/074ec16647809619aed56454967225b67c945ee5))
* **reavion-driver:** keep press_key modifiers on native Wayland ([#2573](https://github.com/helderperez-dev/reavion-driver/issues/2573)) ([669c917](https://github.com/helderperez-dev/reavion-driver/commit/669c9177895c4998aa2d393f01e262d506384eb0))
* **reavion-driver:** Linux list_windows emits `bounds` for cross-platform parity ([#2017](https://github.com/helderperez-dev/reavion-driver/issues/2017)) ([#2018](https://github.com/helderperez-dev/reavion-driver/issues/2018)) ([9e84c1d](https://github.com/helderperez-dev/reavion-driver/commit/9e84c1d8826dc1bfba166456b34f86a9d6212e0d))
* **reavion-driver:** Linux X11 and Wayland convergence ([#2182](https://github.com/helderperez-dev/reavion-driver/issues/2182)) ([51a8e25](https://github.com/helderperez-dev/reavion-driver/commit/51a8e2593fc88efd4f0678d9ab7bbba50c22c91b))
* **reavion-driver:** macOS e2e convergence (conv2 3/7) ([#2183](https://github.com/helderperez-dev/reavion-driver/issues/2183)) ([1d0ff7c](https://github.com/helderperez-dev/reavion-driver/commit/1d0ff7cc3ef7cfcadbf86b8c4b96ab396e319317))
* **reavion-driver:** make install-local TCC grants survive rebuilds and release↔local switches ([af75ca5](https://github.com/helderperez-dev/reavion-driver/commit/af75ca5e774e01efc0648a408726343e7133ccd1))
* **reavion-driver:** make macOS permission consent explicit and durable ([#2407](https://github.com/helderperez-dev/reavion-driver/issues/2407)) ([7ac41be](https://github.com/helderperez-dev/reavion-driver/commit/7ac41be61e6b1c0034cd9d4de48ac2d5f7bf6b13))
* **reavion-driver:** make macOS SDK load standalone ([#2477](https://github.com/helderperez-dev/reavion-driver/issues/2477)) ([457b17e](https://github.com/helderperez-dev/reavion-driver/commit/457b17eae8ea2d2ca1b45ad5b23fc342787769a7))
* **reavion-driver:** model Linux dialog delivery ([31b4f85](https://github.com/helderperez-dev/reavion-driver/commit/31b4f85755da8d5f5e793745839e2b0639188b22))
* **reavion-driver:** persist set_config to disk on Windows + Linux ([#2034](https://github.com/helderperez-dev/reavion-driver/issues/2034)) ([e08574c](https://github.com/helderperez-dev/reavion-driver/commit/e08574ca0b3c7ca5c0d9ae33e6ceeac9a45e0d20))
* **reavion-driver:** pick the AT-SPI action by name, not by position ([#2574](https://github.com/helderperez-dev/reavion-driver/issues/2574)) ([ee77164](https://github.com/helderperez-dev/reavion-driver/commit/ee77164b285d9ba313bdd7da03b32449722d8ce4))
* **reavion-driver:** prefer foreground delivery in refusal guidance ([#2623](https://github.com/helderperez-dev/reavion-driver/issues/2623)) ([6d97684](https://github.com/helderperez-dev/reavion-driver/commit/6d97684fc4beebbb4ea3d658fa49817f9b7cd0f8))
* **reavion-driver:** preserve approved Windows CDP port proof ([2527e77](https://github.com/helderperez-dev/reavion-driver/commit/2527e771ca0ea5aaed0c3d62d52ff4b07322264a))
* **reavion-driver:** preserve cross-platform browser posture ([6ea7806](https://github.com/helderperez-dev/reavion-driver/commit/6ea780690388c33498a8111bc618d7fd0bc8d196))
* **reavion-driver:** preserve Windows autostart path quoting ([cf07c2c](https://github.com/helderperez-dev/reavion-driver/commit/cf07c2c9ef7b17808d4152d91bb6c5ee22b733ab))
* **reavion-driver:** prevent silent ad-hoc local signing ([#2495](https://github.com/helderperez-dev/reavion-driver/issues/2495)) ([b680ff2](https://github.com/helderperez-dev/reavion-driver/commit/b680ff2db0c87407e188f6d8fdd28a6bc77228b0))
* **reavion-driver:** recover invalid Windows bounds ([#2601](https://github.com/helderperez-dev/reavion-driver/issues/2601)) ([0026845](https://github.com/helderperez-dev/reavion-driver/commit/0026845a096fd5a960e6f97742fbaedb054998be))
* **reavion-driver:** redial Chrome after native consent ([#2635](https://github.com/helderperez-dev/reavion-driver/issues/2635)) ([fdebc59](https://github.com/helderperez-dev/reavion-driver/commit/fdebc59791ae2a8c6bc25f29770dc21f3c5faea7))
* **reavion-driver:** refuse background window-move drags on Windows ([#2559](https://github.com/helderperez-dev/reavion-driver/issues/2559)) ([68b8943](https://github.com/helderperez-dev/reavion-driver/commit/68b8943c5c703809f654aef1d2f81de4197657a5))
* **reavion-driver:** refuse disabled macOS AX actions ([#2637](https://github.com/helderperez-dev/reavion-driver/issues/2637)) ([8f9c2df](https://github.com/helderperez-dev/reavion-driver/commit/8f9c2dfd422a14a29fa49870e26f790c0c0ef211))
* **reavion-driver:** refuse dropped ConsoleHost typing on Windows ARM64 ([bd5a8d3](https://github.com/helderperez-dev/reavion-driver/commit/bd5a8d343cec5b9125b144e62d5348bc7814a425))
* **reavion-driver:** register bundle in LaunchServices before tccutil reset ([#2376](https://github.com/helderperez-dev/reavion-driver/issues/2376)) ([767acf2](https://github.com/helderperez-dev/reavion-driver/commit/767acf25f25ea668ffab428e4f2e8985896de98e))
* **reavion-driver:** reject browser-origin MCP HTTP requests ([#2378](https://github.com/helderperez-dev/reavion-driver/issues/2378)) ([fccac48](https://github.com/helderperez-dev/reavion-driver/commit/fccac4852e7d1141ab0b03202c9093d5e826d448))
* **reavion-driver:** report unknown browser tab selection ([6611622](https://github.com/helderperez-dev/reavion-driver/commit/6611622d6c6ef355661c80b6ecae765694088153))
* **reavion-driver:** request macOS permissions from running daemon ([#2414](https://github.com/helderperez-dev/reavion-driver/issues/2414)) ([231839d](https://github.com/helderperez-dev/reavion-driver/commit/231839de8161c85b63b86f8a54678a0cd9816335))
* **reavion-driver:** reset TCC grant on release/local signing transition ([fa309eb](https://github.com/helderperez-dev/reavion-driver/commit/fa309eb5ed0aac1e63c9eaf80dcb2a7749b8b472))
* **reavion-driver:** restore focus after bounded browser setup ([2b06a78](https://github.com/helderperez-dev/reavion-driver/commit/2b06a782544e9fc742bf2e90c80d65d9b5c6f721))
* **reavion-driver:** restore macOS background pixel clicks ([1fbcacf](https://github.com/helderperez-dev/reavion-driver/commit/1fbcacf6f5ecdec31414a364c3c4450dfce82e70))
* **reavion-driver:** restore v0.12.5 and v0.12.6 installs ([#2598](https://github.com/helderperez-dev/reavion-driver/issues/2598)) ([fc17069](https://github.com/helderperez-dev/reavion-driver/commit/fc17069b69786f81ae0ff50eefeabe328b06dc4b))
* **reavion-driver:** retain country-only telemetry ([#2217](https://github.com/helderperez-dev/reavion-driver/issues/2217)) ([a705c2a](https://github.com/helderperez-dev/reavion-driver/commit/a705c2ac463392109063c171ca4586a29811103c))
* **reavion-driver:** retry daemon socket writes on EAGAIN, write-side mirror of [#1997](https://github.com/helderperez-dev/reavion-driver/issues/1997) ([#2036](https://github.com/helderperez-dev/reavion-driver/issues/2036)) ([d524d97](https://github.com/helderperez-dev/reavion-driver/commit/d524d97b5a414a9df9d62767d627f24b17bb6353))
* **reavion-driver:** retry transient Windows CDP discovery ([4f5abc2](https://github.com/helderperez-dev/reavion-driver/commit/4f5abc2a231e9a8565326d7f58e78477f09e2666))
* **reavion-driver:** reuse self-signed local identity ([a27753e](https://github.com/helderperez-dev/reavion-driver/commit/a27753e457be1947728fcaa298f077bb306172e9))
* **reavion-driver:** separate local and release identities ([#2404](https://github.com/helderperez-dev/reavion-driver/issues/2404)) ([a8d8142](https://github.com/helderperez-dev/reavion-driver/commit/a8d8142bc1dfef641cae80680e0aa9c9230fffb8))
* **reavion-driver:** show active-tab browser cursors on macOS ([#2493](https://github.com/helderperez-dev/reavion-driver/issues/2493)) ([c7675a0](https://github.com/helderperez-dev/reavion-driver/commit/c7675a04d5d3b53a0809db8347b11a23ac81ce63))
* **reavion-driver:** show Windows browser action cursors ([#2532](https://github.com/helderperez-dev/reavion-driver/issues/2532)) ([8271dd8](https://github.com/helderperez-dev/reavion-driver/commit/8271dd8abaafe49f774f5f6a9ba676b0596510d0))
* **reavion-driver:** stabilize background browser tabs ([3348fc5](https://github.com/helderperez-dev/reavion-driver/commit/3348fc5778e5b0dfb9402d2c13048c301eda9f57))
* **reavion-driver:** support Electron UniFFI buffers ([#2455](https://github.com/helderperez-dev/reavion-driver/issues/2455)) ([d3bf82a](https://github.com/helderperez-dev/reavion-driver/commit/d3bf82a2cbb27fd83cfa836c04f9f5678e3e3aad))
* **reavion-driver:** support Windows ARM64 browser sessions ([9c5a78b](https://github.com/helderperez-dev/reavion-driver/commit/9c5a78b65b09bedceea1faafe09f1ac9488e588b))
* **reavion-driver:** target page JavaScript exactly ([#2166](https://github.com/helderperez-dev/reavion-driver/issues/2166)) ([fb5bc19](https://github.com/helderperez-dev/reavion-driver/commit/fb5bc192a5311d0519447f1d301bdf0b0c93bbb0))
* **reavion-driver:** trust native macOS sentinel focus ([#2481](https://github.com/helderperez-dev/reavion-driver/issues/2481)) ([6c2bbcc](https://github.com/helderperez-dev/reavion-driver/commit/6c2bbccfe5ad6690ef0961c492b34a3493354e84))
* **reavion-driver:** verify desktop input effects and release modifiers ([#2492](https://github.com/helderperez-dev/reavion-driver/issues/2492)) ([5b68ef5](https://github.com/helderperez-dev/reavion-driver/commit/5b68ef596f9adf183121e864d19db5e0ee7ddd4d))
* **reavion-driver:** verify set_value writes with an AXValue read-back ([#2621](https://github.com/helderperez-dev/reavion-driver/issues/2621)) ([e143b95](https://github.com/helderperez-dev/reavion-driver/commit/e143b9565069aa35c9ff21fec171858d8a264b06))
* **reavion-driver:** wait for background tab input readiness ([a19e909](https://github.com/helderperez-dev/reavion-driver/commit/a19e909db8bfd236c8f71ab56edfd4c3fdc7c807))
* **reavion-driver:** wait for generic type_text completion ([#2463](https://github.com/helderperez-dev/reavion-driver/issues/2463)) ([3858c7f](https://github.com/helderperez-dev/reavion-driver/commit/3858c7f2aafc3d03f5a6342d255a625d79b184fb))
* **reavion-driver:** Windows e2e convergence ([#2180](https://github.com/helderperez-dev/reavion-driver/issues/2180)) ([88f88e1](https://github.com/helderperez-dev/reavion-driver/commit/88f88e1b5a31810699781e49f2dd9b9733fbaa82))
* **driver:** remove current autostart services on uninstall ([#2358](https://github.com/helderperez-dev/reavion-driver/issues/2358)) ([4a492f3](https://github.com/helderperez-dev/reavion-driver/commit/4a492f36704eaf063a82eadd0469d08684c7a1f5))
* **driver:** require daemon-backed calls and stabilize E2E ([#2338](https://github.com/helderperez-dev/reavion-driver/issues/2338)) ([9251bb0](https://github.com/helderperez-dev/reavion-driver/commit/9251bb006018d829b452e7109e322eab3f8c9633))
* **release:** synchronize driver skill versions ([fa5092b](https://github.com/helderperez-dev/reavion-driver/commit/fa5092bac1ed8e41703ac379814965f6773e8cab))
* **release:** synchronize driver skill versions ([512e45a](https://github.com/helderperez-dev/reavion-driver/commit/512e45a03fc0b4390f3d29b6443db5821157f7a0))

## [0.13.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.12.6...reavion-driver-rs-v0.13.0) (2026-07-28)

> **Retracted:** 0.13.0 was published unintentionally and is not supported.
> Do not use this release. Distribution artifacts are being withdrawn; package
> registries permanently reserve published version numbers, so 0.13.0 will not
> be republished.


### ⚠ BREAKING CHANGES

* **reavion-driver:** simplify permissions and add session identity ([#2616](https://github.com/helderperez-dev/reavion-driver/issues/2616))
* **reavion-driver:** ship semantic cursor themes

### Features

* **reavion-driver:** add local consent UI and complete Wayland certification ([#2597](https://github.com/helderperez-dev/reavion-driver/issues/2597)) ([e9852cb](https://github.com/helderperez-dev/reavion-driver/commit/e9852cb68494e9f521c7734206f638773dbc3299))
* **reavion-driver:** browser_type can replace a field's content, not only append ([#2624](https://github.com/helderperez-dev/reavion-driver/issues/2624)) ([eb0b5a0](https://github.com/helderperez-dev/reavion-driver/commit/eb0b5a0c72cd1203e1dcaab768cdf37c33868302))
* **reavion-driver:** centralize protected resource grants per runtime ([#2577](https://github.com/helderperez-dev/reavion-driver/issues/2577)) ([dfb3781](https://github.com/helderperez-dev/reavion-driver/commit/dfb3781460f04f9b523871b2f478233a59e5d364))
* **reavion-driver:** enforce consequential and privileged actions ([#2585](https://github.com/helderperez-dev/reavion-driver/issues/2585)) ([df368a7](https://github.com/helderperez-dev/reavion-driver/commit/df368a7698a07ec9ba7e10952d483457c22841ff))
* **reavion-driver:** enforce desktop input grants ([#2580](https://github.com/helderperez-dev/reavion-driver/issues/2580)) ([2b5e938](https://github.com/helderperez-dev/reavion-driver/commit/2b5e938d7014ccdced5abe6d1c4d493063f67b56))
* **reavion-driver:** enforce exact file transfer grants ([#2581](https://github.com/helderperez-dev/reavion-driver/issues/2581)) ([3f74894](https://github.com/helderperez-dev/reavion-driver/commit/3f748946ecc176d2d7a71add246c5647acca2be3))
* **reavion-driver:** enforce private observation grants ([#2579](https://github.com/helderperez-dev/reavion-driver/issues/2579)) ([6052381](https://github.com/helderperez-dev/reavion-driver/commit/6052381e97446cca3338221eb888c49e57356890))
* **reavion-driver:** expose trusted protected-consent hosts ([#2578](https://github.com/helderperez-dev/reavion-driver/issues/2578)) ([fd4069e](https://github.com/helderperez-dev/reavion-driver/commit/fd4069ec6de49e9fa499e3057e874b9dae1d9665))
* **reavion-driver:** implement SDK-owned runtime RFC ([#2561](https://github.com/helderperez-dev/reavion-driver/issues/2561)) ([1760f25](https://github.com/helderperez-dev/reavion-driver/commit/1760f253d3c4d76618a8c97a04f2c100ffc491ac))
* **reavion-driver:** make permission adapter inventory mode-aware ([#2576](https://github.com/helderperez-dev/reavion-driver/issues/2576)) ([83a2f6f](https://github.com/helderperez-dev/reavion-driver/commit/83a2f6fad7b2f3349be40433e343cd8f934495eb))
* **reavion-driver:** make SDK-owned runtime the default ([#2545](https://github.com/helderperez-dev/reavion-driver/issues/2545)) ([a62e821](https://github.com/helderperez-dev/reavion-driver/commit/a62e8219255f15f6ed747c03337198d6fe32912f))
* **reavion-driver:** ship semantic cursor themes ([e06e922](https://github.com/helderperez-dev/reavion-driver/commit/e06e9229ba65529f1594b11a6834cc2738117045))
* **reavion-driver:** ship vector semantic cursor themes ([#2603](https://github.com/helderperez-dev/reavion-driver/issues/2603)) ([e2c52d5](https://github.com/helderperez-dev/reavion-driver/commit/e2c52d50ba331798a3da4871fdad3bbcdd399633))
* **reavion-driver:** simplify permissions and add session identity ([#2616](https://github.com/helderperez-dev/reavion-driver/issues/2616)) ([8dac16e](https://github.com/helderperez-dev/reavion-driver/commit/8dac16e2c22a24687983e0e169a4dc2329e6cadb))
* **reavion-driver:** support multiple direct runtimes per process ([#2575](https://github.com/helderperez-dev/reavion-driver/issues/2575)) ([5f786b0](https://github.com/helderperez-dev/reavion-driver/commit/5f786b058162bc69caacaa00c05f6fcca85d9d3d))


### Bug Fixes

* **reavion-driver:** accept letter keys on Windows ([#2551](https://github.com/helderperez-dev/reavion-driver/issues/2551)) ([506a4ed](https://github.com/helderperez-dev/reavion-driver/commit/506a4ede22dfe791b3630640bc0c24e0f03c6d96))
* **reavion-driver:** activate Chromium checkboxes safely on Linux ([#2633](https://github.com/helderperez-dev/reavion-driver/issues/2633)) ([1f16242](https://github.com/helderperez-dev/reavion-driver/commit/1f16242750df58b6af4b7b44f4f3a317a66a4bb1))
* **reavion-driver:** avoid leaking XInput masters without uinput ([36e8d5a](https://github.com/helderperez-dev/reavion-driver/commit/36e8d5ad480096d0e5b576912674bdc3b9a89267))
* **reavion-driver:** carry full 32-bit snapshot generation in element tokens ([#2608](https://github.com/helderperez-dev/reavion-driver/issues/2608)) ([fcac692](https://github.com/helderperez-dev/reavion-driver/commit/fcac692b6d6531a32f3ebc5d7a9ba675d90ec86a))
* **reavion-driver:** clarify foreground escalation guidance ([b4f6ffc](https://github.com/helderperez-dev/reavion-driver/commit/b4f6ffca79b4f746e28b30eaa041c534704ee372))
* **reavion-driver:** declare WinRects support for GNOME Shell 49 and 50 ([#2565](https://github.com/helderperez-dev/reavion-driver/issues/2565)) ([776dadd](https://github.com/helderperez-dev/reavion-driver/commit/776daddcbc7dba345343f0e0f709bd9c486ec087))
* **reavion-driver:** keep press_key modifiers on native Wayland ([#2573](https://github.com/helderperez-dev/reavion-driver/issues/2573)) ([669c917](https://github.com/helderperez-dev/reavion-driver/commit/669c9177895c4998aa2d393f01e262d506384eb0))
* **reavion-driver:** pick the AT-SPI action by name, not by position ([#2574](https://github.com/helderperez-dev/reavion-driver/issues/2574)) ([ee77164](https://github.com/helderperez-dev/reavion-driver/commit/ee77164b285d9ba313bdd7da03b32449722d8ce4))
* **reavion-driver:** prefer foreground delivery in refusal guidance ([#2623](https://github.com/helderperez-dev/reavion-driver/issues/2623)) ([6d97684](https://github.com/helderperez-dev/reavion-driver/commit/6d97684fc4beebbb4ea3d658fa49817f9b7cd0f8))
* **reavion-driver:** preserve Windows autostart path quoting ([cf07c2c](https://github.com/helderperez-dev/reavion-driver/commit/cf07c2c9ef7b17808d4152d91bb6c5ee22b733ab))
* **reavion-driver:** recover invalid Windows bounds ([#2601](https://github.com/helderperez-dev/reavion-driver/issues/2601)) ([0026845](https://github.com/helderperez-dev/reavion-driver/commit/0026845a096fd5a960e6f97742fbaedb054998be))
* **reavion-driver:** redial Chrome after native consent ([#2635](https://github.com/helderperez-dev/reavion-driver/issues/2635)) ([fdebc59](https://github.com/helderperez-dev/reavion-driver/commit/fdebc59791ae2a8c6bc25f29770dc21f3c5faea7))
* **reavion-driver:** refuse disabled macOS AX actions ([#2637](https://github.com/helderperez-dev/reavion-driver/issues/2637)) ([8f9c2df](https://github.com/helderperez-dev/reavion-driver/commit/8f9c2dfd422a14a29fa49870e26f790c0c0ef211))
* **reavion-driver:** reject browser-origin MCP HTTP requests ([#2378](https://github.com/helderperez-dev/reavion-driver/issues/2378)) ([fccac48](https://github.com/helderperez-dev/reavion-driver/commit/fccac4852e7d1141ab0b03202c9093d5e826d448))
* **reavion-driver:** restore macOS background pixel clicks ([1fbcacf](https://github.com/helderperez-dev/reavion-driver/commit/1fbcacf6f5ecdec31414a364c3c4450dfce82e70))
* **reavion-driver:** restore v0.12.5 and v0.12.6 installs ([#2598](https://github.com/helderperez-dev/reavion-driver/issues/2598)) ([fc17069](https://github.com/helderperez-dev/reavion-driver/commit/fc17069b69786f81ae0ff50eefeabe328b06dc4b))
* **reavion-driver:** verify set_value writes with an AXValue read-back ([#2621](https://github.com/helderperez-dev/reavion-driver/issues/2621)) ([e143b95](https://github.com/helderperez-dev/reavion-driver/commit/e143b9565069aa35c9ff21fec171858d8a264b06))

## [0.12.6](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.12.5...reavion-driver-rs-v0.12.6) (2026-07-24)


### Bug Fixes

* **reavion-driver:** isolate Wayland portal connections ([#2552](https://github.com/helderperez-dev/reavion-driver/issues/2552)) ([074ec16](https://github.com/helderperez-dev/reavion-driver/commit/074ec16647809619aed56454967225b67c945ee5))

## [0.12.5](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.12.4...reavion-driver-rs-v0.12.5) (2026-07-24)


### Bug Fixes

* **reavion-driver:** enforce authorization in embedded SDK ([#2542](https://github.com/helderperez-dev/reavion-driver/issues/2542)) ([06bda89](https://github.com/helderperez-dev/reavion-driver/commit/06bda89f078e882a64ecccb78700ff26dc4d210f))
* **reavion-driver:** refuse dropped ConsoleHost typing on Windows ARM64 ([bd5a8d3](https://github.com/helderperez-dev/reavion-driver/commit/bd5a8d343cec5b9125b144e62d5348bc7814a425))

## [0.12.4](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.12.3...reavion-driver-rs-v0.12.4) (2026-07-24)


### Bug Fixes

* **reavion-driver:** deliver foreground pixel hotkeys through HID ([#2464](https://github.com/helderperez-dev/reavion-driver/issues/2464)) ([bc1a58d](https://github.com/helderperez-dev/reavion-driver/commit/bc1a58d7926fadbc79b7d2925895878b9ab81cda))
* **reavion-driver:** expose skill install failure details ([#2510](https://github.com/helderperez-dev/reavion-driver/issues/2510)) ([d614d8d](https://github.com/helderperez-dev/reavion-driver/commit/d614d8db689cd663f9e8d784ff03ac1bd388f506))
* **reavion-driver:** honor Cargo target dir in local installs ([#2486](https://github.com/helderperez-dev/reavion-driver/issues/2486)) ([7cb6810](https://github.com/helderperez-dev/reavion-driver/commit/7cb6810b429ec9723c9e2050d6670340eeda4265))
* **reavion-driver:** show Windows browser action cursors ([#2532](https://github.com/helderperez-dev/reavion-driver/issues/2532)) ([8271dd8](https://github.com/helderperez-dev/reavion-driver/commit/8271dd8abaafe49f774f5f6a9ba676b0596510d0))
* **reavion-driver:** support Windows ARM64 browser sessions ([9c5a78b](https://github.com/helderperez-dev/reavion-driver/commit/9c5a78b65b09bedceea1faafe09f1ac9488e588b))
* **reavion-driver:** wait for generic type_text completion ([#2463](https://github.com/helderperez-dev/reavion-driver/issues/2463)) ([3858c7f](https://github.com/helderperez-dev/reavion-driver/commit/3858c7f2aafc3d03f5a6342d255a625d79b184fb))

## [0.12.3](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.12.2...reavion-driver-rs-v0.12.3) (2026-07-23)


### Bug Fixes

* **reavion-driver:** diagnose stale local MCP registrations ([#2498](https://github.com/helderperez-dev/reavion-driver/issues/2498)) ([df10b6d](https://github.com/helderperez-dev/reavion-driver/commit/df10b6d3d4b194a714656d3d8758db5017234de0))
* **reavion-driver:** prevent silent ad-hoc local signing ([#2495](https://github.com/helderperez-dev/reavion-driver/issues/2495)) ([b680ff2](https://github.com/helderperez-dev/reavion-driver/commit/b680ff2db0c87407e188f6d8fdd28a6bc77228b0))
* **reavion-driver:** show active-tab browser cursors on macOS ([#2493](https://github.com/helderperez-dev/reavion-driver/issues/2493)) ([c7675a0](https://github.com/helderperez-dev/reavion-driver/commit/c7675a04d5d3b53a0809db8347b11a23ac81ce63))
* **reavion-driver:** verify desktop input effects and release modifiers ([#2492](https://github.com/helderperez-dev/reavion-driver/issues/2492)) ([5b68ef5](https://github.com/helderperez-dev/reavion-driver/commit/5b68ef596f9adf183121e864d19db5e0ee7ddd4d))

## [0.12.2](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.12.1...reavion-driver-rs-v0.12.2) (2026-07-23)


### Bug Fixes

* **reavion-driver:** tolerate fileno-less Python stdio ([#2482](https://github.com/helderperez-dev/reavion-driver/issues/2482)) ([d041f1a](https://github.com/helderperez-dev/reavion-driver/commit/d041f1a580d413bbe5da6645fd58b9088b2cdd4a))
* **reavion-driver:** trust native macOS sentinel focus ([#2481](https://github.com/helderperez-dev/reavion-driver/issues/2481)) ([6c2bbcc](https://github.com/helderperez-dev/reavion-driver/commit/6c2bbccfe5ad6690ef0961c492b34a3493354e84))

## [0.12.1](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.12.0...reavion-driver-rs-v0.12.1) (2026-07-23)


### Bug Fixes

* **reavion-driver:** make macOS SDK load standalone ([#2477](https://github.com/helderperez-dev/reavion-driver/issues/2477)) ([457b17e](https://github.com/helderperez-dev/reavion-driver/commit/457b17eae8ea2d2ca1b45ad5b23fc342787769a7))

## [0.12.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.11.0...reavion-driver-rs-v0.12.0) (2026-07-22)


### Features

* **reavion-driver:** add client and modality telemetry ([#2441](https://github.com/helderperez-dev/reavion-driver/issues/2441)) ([5cd0000](https://github.com/helderperez-dev/reavion-driver/commit/5cd0000e2e018a835303a8f8bdd82a88ea483a6e))
* **reavion-driver:** add true in-process SDK runtime ([#2461](https://github.com/helderperez-dev/reavion-driver/issues/2461)) ([617508a](https://github.com/helderperez-dev/reavion-driver/commit/617508a7ae123f277b203d31fca29933927a4636))
* **reavion-driver:** add versioned native ABI ([b172afc](https://github.com/helderperez-dev/reavion-driver/commit/b172afc75f39832a4bdfaa9040d6d4f556449b49))
* **reavion-driver:** expose macOS control state in window elements ([db281a3](https://github.com/helderperez-dev/reavion-driver/commit/db281a3b0d9bbabaf74f3c6847adf6abbb66995a))


### Bug Fixes

* **reavion-driver:** advertise delivery mode capability ([7f6657c](https://github.com/helderperez-dev/reavion-driver/commit/7f6657c440cedf1f20c6307c849a89487f867b41)), closes [#2425](https://github.com/helderperez-dev/reavion-driver/issues/2425)
* **reavion-driver:** avoid SIGCHLD handler in doctor ([31bbc07](https://github.com/helderperez-dev/reavion-driver/commit/31bbc074d75f59fe2c417cddc66cf4093bd8330b)), closes [#2348](https://github.com/helderperez-dev/reavion-driver/issues/2348)
* **reavion-driver:** enforce scope for mouse button actions ([caa241b](https://github.com/helderperez-dev/reavion-driver/commit/caa241be5f801e2060d4f5823fde64f9e6dc2be4)), closes [#2368](https://github.com/helderperez-dev/reavion-driver/issues/2368)
* **reavion-driver:** support Electron UniFFI buffers ([#2455](https://github.com/helderperez-dev/reavion-driver/issues/2455)) ([d3bf82a](https://github.com/helderperez-dev/reavion-driver/commit/d3bf82a2cbb27fd83cfa836c04f9f5678e3e3aad))

## [0.11.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.10.0...reavion-driver-rs-v0.11.0) (2026-07-22)


### ⚠ BREAKING CHANGES

* **reavion-driver:** replace language MCP clients with Rust SDKs ([#2341](https://github.com/helderperez-dev/reavion-driver/issues/2341))

### Features

* **reavion-driver:** add persistent macOS interactive input sessions ([2dad3e5](https://github.com/helderperez-dev/reavion-driver/commit/2dad3e519e17b27eaa793151b8671957f578072c))
* **reavion-driver:** add Rust-owned embedded host for SDK and MCP ([#2427](https://github.com/helderperez-dev/reavion-driver/issues/2427)) ([5016dc1](https://github.com/helderperez-dev/reavion-driver/commit/5016dc16bfe54c165e6678104ec521a6d85f76db))
* **reavion-driver:** capture inactive tabs and retain modal controls ([#2426](https://github.com/helderperez-dev/reavion-driver/issues/2426)) ([c4d7ddc](https://github.com/helderperez-dev/reavion-driver/commit/c4d7ddc5bc7c00faf3e9102bee664ea47b2f5fac))
* **reavion-driver:** replace language MCP clients with Rust SDKs ([#2341](https://github.com/helderperez-dev/reavion-driver/issues/2341)) ([b8a0f32](https://github.com/helderperez-dev/reavion-driver/commit/b8a0f32a06c75225ba24ebb5ab14f6507fa90d15))
* **reavion-driver:** track update funnel telemetry ([#2392](https://github.com/helderperez-dev/reavion-driver/issues/2392)) ([994308a](https://github.com/helderperez-dev/reavion-driver/commit/994308a96649109c4e6334acba7179acc8542155))


### Bug Fixes

* **reavion-driver:** classify health_report as read-only diagnostics ([#2408](https://github.com/helderperez-dev/reavion-driver/issues/2408)) ([16e7573](https://github.com/helderperez-dev/reavion-driver/commit/16e7573363adaf3cb6abcfbe8ebf04b7172ff160)), closes [#2399](https://github.com/helderperez-dev/reavion-driver/issues/2399)
* **reavion-driver:** make macOS permission consent explicit and durable ([#2407](https://github.com/helderperez-dev/reavion-driver/issues/2407)) ([7ac41be](https://github.com/helderperez-dev/reavion-driver/commit/7ac41be61e6b1c0034cd9d4de48ac2d5f7bf6b13))
* **reavion-driver:** request macOS permissions from running daemon ([#2414](https://github.com/helderperez-dev/reavion-driver/issues/2414)) ([231839d](https://github.com/helderperez-dev/reavion-driver/commit/231839de8161c85b63b86f8a54678a0cd9816335))
* **reavion-driver:** separate local and release identities ([#2404](https://github.com/helderperez-dev/reavion-driver/issues/2404)) ([a8d8142](https://github.com/helderperez-dev/reavion-driver/commit/a8d8142bc1dfef641cae80680e0aa9c9230fffb8))

## [0.10.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.9.1...reavion-driver-rs-v0.10.0) (2026-07-20)


### Features

* **reavion-driver:** add protected permission modes and consent grants ([#2383](https://github.com/helderperez-dev/reavion-driver/issues/2383)) ([c75e606](https://github.com/helderperez-dev/reavion-driver/commit/c75e60636c11e21ef44f1ebbe1c1350339bae295))


### Bug Fixes

* **reavion-driver:** bound tool telemetry volume ([#2382](https://github.com/helderperez-dev/reavion-driver/issues/2382)) ([99d4d61](https://github.com/helderperez-dev/reavion-driver/commit/99d4d613abc35a67753d206fcf3371673fb75edd))
* **reavion-driver:** register bundle in LaunchServices before tccutil reset ([#2376](https://github.com/helderperez-dev/reavion-driver/issues/2376)) ([767acf2](https://github.com/helderperez-dev/reavion-driver/commit/767acf25f25ea668ffab428e4f2e8985896de98e))

## [0.9.1](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.9.0...reavion-driver-rs-v0.9.1) (2026-07-20)


### Bug Fixes

* **reavion-driver:** fail closed for unsupported browser and Wayland routes ([#2367](https://github.com/helderperez-dev/reavion-driver/pull/2367))
* **reavion-driver:** harden exact-profile browser attachment across Chrome and Edge ([#2367](https://github.com/helderperez-dev/reavion-driver/pull/2367))
* **reavion-driver:** restore focus after bounded browser setup ([#2367](https://github.com/helderperez-dev/reavion-driver/pull/2367))

## [0.9.0](https://github.com/helderperez-dev/reavion-driver/compare/reavion-driver-rs-v0.8.3...reavion-driver-rs-v0.9.0) (2026-07-19)


### Features

* **reavion-driver-rs:** add Linux arm64 (aarch64) prebuilt support ([#1948](https://github.com/helderperez-dev/reavion-driver/issues/1948)) ([79884bd](https://github.com/helderperez-dev/reavion-driver/commit/79884bde1ea483affc907f2b6b264382023dbf17))
* **reavion-driver-rs:** become own responsible process for true TCC status ([#1956](https://github.com/helderperez-dev/reavion-driver/issues/1956)) ([d61ce01](https://github.com/helderperez-dev/reavion-driver/commit/d61ce0197ee4f396220e4094da05745825a7b440))
* **reavion-driver-rs:** caller-declared session identity + Streamable-HTTP transport for multi-agent parallelism ([#1798](https://github.com/helderperez-dev/reavion-driver/issues/1798)) ([e1e8c98](https://github.com/helderperez-dev/reavion-driver/commit/e1e8c98208f64c0e12d8683647091b1f264a7613))
* **reavion-driver-rs:** check-update CLI verb + check_for_update MCP tool ([#1734](https://github.com/helderperez-dev/reavion-driver/issues/1734)) ([7d893ce](https://github.com/helderperez-dev/reavion-driver/commit/7d893ce827fe0d3730c696cef7eae70d98602bed))
* **reavion-driver-rs:** daemon session identity — own + clean up session-scoped recording & config ([#1776](https://github.com/helderperez-dev/reavion-driver/issues/1776)) ([748e74a](https://github.com/helderperez-dev/reavion-driver/commit/748e74a84ef0581c98ff95e4a40b98ab28b07dae))
* **reavion-driver-rs:** wire up --claude-code-computer-use-compat + make it default for claude ([#1678](https://github.com/helderperez-dev/reavion-driver/issues/1678)) ([ec07873](https://github.com/helderperez-dev/reavion-driver/commit/ec0787363da03595381b62c6a4781b1a0fcd955c))
* **reavion-driver/macos:** implement page click_element + fix Chromium window targeting ([#2082](https://github.com/helderperez-dev/reavion-driver/issues/2082)) ([73fe822](https://github.com/helderperez-dev/reavion-driver/commit/73fe8227982c0b03795669e4cdf62384f0d54a34))
* **reavion-driver:** add aggregate agent session telemetry ([aa41707](https://github.com/helderperez-dev/reavion-driver/commit/aa417076c7d31df9d78dc72e982b48b5506e1695))
* **reavion-driver:** add aggregate agent session telemetry ([3a59246](https://github.com/helderperez-dev/reavion-driver/commit/3a5924640738e9881efc11a80b6e26ed6ef5ed0a))
* **reavion-driver:** add bounded feature telemetry ([4972560](https://github.com/helderperez-dev/reavion-driver/commit/4972560226ea3ff81c5d07ca3e867fbaa5238f69))
* **reavion-driver:** add bounded feature telemetry ([ebfb4eb](https://github.com/helderperez-dev/reavion-driver/commit/ebfb4eb7fa48e028d4a64ec94ddda2f466d8313d))
* **reavion-driver:** add browser dialogs and uploads ([21ca689](https://github.com/helderperez-dev/reavion-driver/commit/21ca68928e546103a59ad851699a50e543ff601b))
* **reavion-driver:** add browser telemetry contract ([fa13890](https://github.com/helderperez-dev/reavion-driver/commit/fa138903f779b33b4c8512c7d64bb960023161fe))
* **reavion-driver:** add browser telemetry contract ([#2310](https://github.com/helderperez-dev/reavion-driver/issues/2310)) ([763a6ea](https://github.com/helderperez-dev/reavion-driver/commit/763a6ea21b86ad5f8a70ab2581edee1dd7370efa))
* **reavion-driver:** add capability-aware browser tools ([#2257](https://github.com/helderperez-dev/reavion-driver/issues/2257)) ([0835daa](https://github.com/helderperez-dev/reavion-driver/commit/0835daa6d415c857c1d3ebefe2c29453a0bed923))
* **reavion-driver:** add semantic browser snapshots ([1a9fbb4](https://github.com/helderperez-dev/reavion-driver/commit/1a9fbb480605f72c449d2c741c19ae32ed5659d8))
* **reavion-driver:** add semantic browser snapshots ([#2301](https://github.com/helderperez-dev/reavion-driver/issues/2301)) ([e83d2d3](https://github.com/helderperez-dev/reavion-driver/commit/e83d2d3d6142fee78edca6352790db4336abacbb))
* **reavion-driver:** add stable health_report MCP tool for end-to-end driver diagnostics ([be761fa](https://github.com/helderperez-dev/reavion-driver/commit/be761fac796d3f266d56ed7ce89c5a5ff6a89eac))
* **reavion-driver:** complete browser mutations ([b4007a8](https://github.com/helderperez-dev/reavion-driver/commit/b4007a8442d3f3238226b5d5d11feda8da13c0af))
* **reavion-driver:** complete telemetry lifecycle coverage ([f06b7cf](https://github.com/helderperez-dev/reavion-driver/commit/f06b7cf26f44721edd968f1dd072eb395212dd10))
* **reavion-driver:** complete telemetry lifecycle coverage ([7ac5836](https://github.com/helderperez-dev/reavion-driver/commit/7ac5836714e99f945e13e840d400f0a637edf56d))
* **reavion-driver:** complete the browser action surface ([#2323](https://github.com/helderperez-dev/reavion-driver/issues/2323)) ([01a9505](https://github.com/helderperez-dev/reavion-driver/commit/01a9505aeac5d2a3afc57a7b1ce98523b58929ae))
* **reavion-driver:** desktop-scope Phase 1 — capture_scope config, get_desktop_state, Windows screen-absolute actions ([#1968](https://github.com/helderperez-dev/reavion-driver/issues/1968)) ([#2019](https://github.com/helderperez-dev/reavion-driver/issues/2019)) ([fc27185](https://github.com/helderperez-dev/reavion-driver/commit/fc271854149771adbb9f2e71ad64e58de5087de7))
* **reavion-driver:** embedded mode — inherit the host app's TCC grants, never prompt ([#2102](https://github.com/helderperez-dev/reavion-driver/issues/2102)) ([b654f27](https://github.com/helderperez-dev/reavion-driver/commit/b654f27d609ecbac22ea63a000c868c90c0ee44d))
* **reavion-driver:** fall back to key events when type-target is a terminal ([687d908](https://github.com/helderperez-dev/reavion-driver/commit/687d908f5efe19ddfd0915f6e654ffb9118bea01))
* **reavion-driver:** Hermes-decoupling MCP surface + install UX ([e85cd87](https://github.com/helderperez-dev/reavion-driver/commit/e85cd878ae859e3c66f53ce83dd0060fdcb0528e))
* **reavion-driver:** prepare ClawHub skill release ([#2265](https://github.com/helderperez-dev/reavion-driver/issues/2265)) ([393c984](https://github.com/helderperez-dev/reavion-driver/commit/393c984190b22543ed0d83ce457e7bfec0653492))
* **reavion-driver:** standardize computer action telemetry ([#2318](https://github.com/helderperez-dev/reavion-driver/issues/2318)) ([9a29c8d](https://github.com/helderperez-dev/reavion-driver/commit/9a29c8dde15591713ddf8657050201894da3c2d8))
* **reavion-driver:** support approved existing browser profiles ([#2261](https://github.com/helderperez-dev/reavion-driver/issues/2261)) ([8582630](https://github.com/helderperez-dev/reavion-driver/commit/8582630ca8f4d2d8ca0315d19dc5073b81a0fed9))
* **reavion-driver:** unify tool telemetry ownership ([1435e84](https://github.com/helderperez-dev/reavion-driver/commit/1435e84a24f3d8de442091a37c229176faa2aba4))
* **reavion-driver:** unify tool telemetry ownership ([ccdace9](https://github.com/helderperez-dev/reavion-driver/commit/ccdace9e7f6c01e08432e91e6eb8c882981c4d05))
* **reavion-driver:** window-less desktop-scope click — macOS + Linux (unified interface) ([#2056](https://github.com/helderperez-dev/reavion-driver/issues/2056)) ([af2255c](https://github.com/helderperez-dev/reavion-driver/commit/af2255c78ba86dfdbdd49e1ce09e42b5101080b1))
* **cursor-overlay:** retina-aware rendering + arrow/teardrop selection ([c172e2a](https://github.com/helderperez-dev/reavion-driver/commit/c172e2acfa038ae437ca2d67795bf90c5c2c02e7))
* **driver:** add per-session capture scope ([#2329](https://github.com/helderperez-dev/reavion-driver/issues/2329)) ([db0ee87](https://github.com/helderperez-dev/reavion-driver/commit/db0ee870c200b5acc9a6542eabc84dc674b729c7))
* **driver:** add YAML and Rego permission policies ([#2235](https://github.com/helderperez-dev/reavion-driver/issues/2235)) ([afb25d7](https://github.com/helderperez-dev/reavion-driver/commit/afb25d740ba7f5b7bfd9970aee7b02919b10eb6e))
* **platform-linux:** native-Wayland parity (wlroots + portal + libei) ([#1966](https://github.com/helderperez-dev/reavion-driver/issues/1966)) ([519dfdf](https://github.com/helderperez-dev/reavion-driver/commit/519dfdfbd6c7cf8e10fa860b15201f84da73eb57))
* **release:** automate Driver and Lume attribution ([#2267](https://github.com/helderperez-dev/reavion-driver/issues/2267)) ([5019927](https://github.com/helderperez-dev/reavion-driver/commit/50199272cff60b11df0374dd26db365338be5744))
* **skills:** autodetect Hermes (NousResearch/hermes-agent) at ~/.hermes/skills ([#1963](https://github.com/helderperez-dev/reavion-driver/issues/1963)) ([9d90c81](https://github.com/helderperez-dev/reavion-driver/commit/9d90c815d31827f64a09d94c1d32d22c327f2770))
* **test-harness:** Linux GTK3 harness app + test (parity with macOS/Windows) ([#2050](https://github.com/helderperez-dev/reavion-driver/issues/2050)) ([aaa3f4c](https://github.com/helderperez-dev/reavion-driver/commit/aaa3f4c4ad0b88fda5f51763a200bb32863a96cd))
* **windows:** background input without z-raise + multi-cursor demos + overlay improvements ([#1809](https://github.com/helderperez-dev/reavion-driver/issues/1809)) ([53bb84c](https://github.com/helderperez-dev/reavion-driver/commit/53bb84cc71cba19f5a91c6cd99f80650a34c5c68))


### Bug Fixes

* **reavion-driver-rs:** feature-gate portal+libei so bullseye CD publishes v0.6.1 ([#1967](https://github.com/helderperez-dev/reavion-driver/issues/1967)) ([5061c11](https://github.com/helderperez-dev/reavion-driver/commit/5061c11b3aa51f596f63838f87a2dca1991aa545))
* **reavion-driver-rs:** make Cargo.toml the source of truth for release bumps ([#1907](https://github.com/helderperez-dev/reavion-driver/issues/1907)) ([dacde81](https://github.com/helderperez-dev/reavion-driver/commit/dacde8147e6c27ee15855e6060fe834c111ce616))
* **reavion-driver-rs:** post-install + Skill hints route through mcp-config (not the broken `claude mcp add -- … --flag` line) ([#1681](https://github.com/helderperez-dev/reavion-driver/issues/1681)) ([ef7e2b6](https://github.com/helderperez-dev/reavion-driver/commit/ef7e2b605c4fa113bde25082812a2c10edb9de7a))
* **reavion-driver-rs:** release installer unifies home on ~/.reavion-driver + cleans up prior local install ([#1803](https://github.com/helderperez-dev/reavion-driver/issues/1803)) ([33a6893](https://github.com/helderperez-dev/reavion-driver/commit/33a6893634f47e809cf83eaed150f65304272948))
* **reavion-driver-rs:** show the agent cursor by default ([#1955](https://github.com/helderperez-dev/reavion-driver/issues/1955)) ([1119035](https://github.com/helderperez-dev/reavion-driver/commit/11190356b3776f2003171872ef0f75c7f5d90d40))
* **reavion-driver-rs:** wire/guide per-session cursors through the real mcp path + skills/docs ([#1787](https://github.com/helderperez-dev/reavion-driver/issues/1787)) ([18e2cbb](https://github.com/helderperez-dev/reavion-driver/commit/18e2cbb1c0c5ce221a2239abbdeb913a07777af9))
* **reavion-driver/install.ps1:** resolve a valid temp dir when $env:TEMP is a missing 8.3 short path ([#1911](https://github.com/helderperez-dev/reavion-driver/issues/1911)) ([#1990](https://github.com/helderperez-dev/reavion-driver/issues/1990)) ([8395169](https://github.com/helderperez-dev/reavion-driver/commit/8395169dbe1c19a17ab4320a8e91066b1c9eefbf))
* **reavion-driver/linux:** auto-discover XAUTHORITY for SSH-driven Wayland+Xwayland ([#1926](https://github.com/helderperez-dev/reavion-driver/issues/1926)) ([#1999](https://github.com/helderperez-dev/reavion-driver/issues/1999)) ([9091a30](https://github.com/helderperez-dev/reavion-driver/commit/9091a30fb4663dcadb65cdf800de774325c2deff))
* **reavion-driver/linux:** bound X11 overlay render work ([#2331](https://github.com/helderperez-dev/reavion-driver/issues/2331)) ([428d7aa](https://github.com/helderperez-dev/reavion-driver/commit/428d7aa5364401c842a5e1428ba3b9ad7009e051))
* **reavion-driver/linux:** fail loudly when X11 input can't be delivered on pure Wayland ([#1921](https://github.com/helderperez-dev/reavion-driver/issues/1921)) ([#1994](https://github.com/helderperez-dev/reavion-driver/issues/1994)) ([7c1d06b](https://github.com/helderperez-dev/reavion-driver/commit/7c1d06bf19d224e4690b6a537e85361cce8c81bb))
* **reavion-driver/linux:** get_desktop_state screen size on pure Wayland ([#2047](https://github.com/helderperez-dev/reavion-driver/issues/2047)) ([6b2b262](https://github.com/helderperez-dev/reavion-driver/commit/6b2b2629debb2b19c57d0c0b2abdaf216ea41d3e))
* **reavion-driver/linux:** glide the agent cursor to the desktop-scope click point ([#2061](https://github.com/helderperez-dev/reavion-driver/issues/2061)) ([7468487](https://github.com/helderperez-dev/reavion-driver/commit/7468487d303469b4993b960c8a2cb66289034bed))
* **reavion-driver/linux:** remap a spare keycode for keysyms absent from the X keymap ([#2048](https://github.com/helderperez-dev/reavion-driver/issues/2048)) ([a139668](https://github.com/helderperez-dev/reavion-driver/commit/a139668f1c87b12bc2ce9a2d2c600252331557d9))
* **reavion-driver/linux:** report dead input backend on KDE/GNOME Wayland instead of silent no-op ([#1982](https://github.com/helderperez-dev/reavion-driver/issues/1982)) ([#1992](https://github.com/helderperez-dev/reavion-driver/issues/1992)) ([3aff226](https://github.com/helderperez-dev/reavion-driver/commit/3aff22663a6409ecca1a42353ebbac3455256237))
* **reavion-driver/linux:** retry root-only AT-SPI tree on cold Qt6 launch ([#1927](https://github.com/helderperez-dev/reavion-driver/issues/1927)) ([#1998](https://github.com/helderperez-dev/reavion-driver/issues/1998)) ([b64af30](https://github.com/helderperez-dev/reavion-driver/commit/b64af303f2f844f20e5de1d10214d6123bf7f680))
* **reavion-driver/linux:** return structured launch_app result ([#2091](https://github.com/helderperez-dev/reavion-driver/issues/2091)) ([c0c6790](https://github.com/helderperez-dev/reavion-driver/commit/c0c67908167f3d0532683b005ad26659dcab8a34))
* **reavion-driver/macos:** set_config accepts {key,value} shape (parity with Win/Linux) ([#2059](https://github.com/helderperez-dev/reavion-driver/issues/2059)) ([3def0d7](https://github.com/helderperez-dev/reavion-driver/commit/3def0d79df66b8a9d0b4dfeb71201ddebe672a1d))
* **reavion-driver/windows:** retry transient BuildUpdatedCache failures instead of returning elements=0 ([#1881](https://github.com/helderperez-dev/reavion-driver/issues/1881)) ([#1996](https://github.com/helderperez-dev/reavion-driver/issues/1996)) ([7518f37](https://github.com/helderperez-dev/reavion-driver/commit/7518f37a3222761e4a3e391f0516c9ae8fe7fa34))
* **reavion-driver/windows:** route DoubleClick/RightClick on Chromium targets via SendInput ([#1984](https://github.com/helderperez-dev/reavion-driver/issues/1984)) ([#1995](https://github.com/helderperez-dev/reavion-driver/issues/1995)) ([26d9298](https://github.com/helderperez-dev/reavion-driver/commit/26d9298e03cc2d6df5d470e9a3707eb21adde398))
* **reavion-driver:** add DPI awareness manifest for Windows ([#1821](https://github.com/helderperez-dev/reavion-driver/issues/1821)) ([b286d9c](https://github.com/helderperez-dev/reavion-driver/commit/b286d9ccd8ea23d40da9e211dd5ad67fa69cd6a8))
* **reavion-driver:** avoid opaque X11 cursor bloom ([#2328](https://github.com/helderperez-dev/reavion-driver/issues/2328)) ([e57fed5](https://github.com/helderperez-dev/reavion-driver/commit/e57fed576afba793db756d0b54e6ff6dde3387d6))
* **reavion-driver:** default install.sh backend back to Swift ([#1762](https://github.com/helderperez-dev/reavion-driver/issues/1762)) ([af6bf41](https://github.com/helderperez-dev/reavion-driver/commit/af6bf41a491f39c28420aaf1abe70e257790678e))
* **reavion-driver:** deliver background browser keystrokes ([a7b7413](https://github.com/helderperez-dev/reavion-driver/commit/a7b741317c86ccd3b1241421e411137f87115eb8))
* **reavion-driver:** deliver trusted background browser clicks ([00f33c4](https://github.com/helderperez-dev/reavion-driver/commit/00f33c4cfaff223a0ade812bb16f4cdb16419d87))
* **reavion-driver:** distinguish autostart query failures ([#2345](https://github.com/helderperez-dev/reavion-driver/issues/2345)) ([0b798a5](https://github.com/helderperez-dev/reavion-driver/commit/0b798a59cbe7f9e628ae488cb8023b9b6f990bd6))
* **reavion-driver:** don't treat socket read-timeout (EAGAIN) as fatal in daemon proxy ([#1864](https://github.com/helderperez-dev/reavion-driver/issues/1864)) ([#1997](https://github.com/helderperez-dev/reavion-driver/issues/1997)) ([b651461](https://github.com/helderperez-dev/reavion-driver/commit/b651461eae8f44083e6d7e1257a4aa1031a05581))
* **reavion-driver:** harden browser preview boundaries ([#2347](https://github.com/helderperez-dev/reavion-driver/pull/2347)) ([667646a](https://github.com/helderperez-dev/reavion-driver/commit/667646af2d6391d419ff2169e7b4ea3e8d7c9ffc))
* **reavion-driver:** harden browser scroll and endpoint proof ([#2353](https://github.com/helderperez-dev/reavion-driver/pull/2353)) ([7510ed9](https://github.com/helderperez-dev/reavion-driver/commit/7510ed9c1f82f66c758e6d02e755350d705cacd5))
* **reavion-driver:** harden existing browser attachment ([2ccb87c](https://github.com/helderperez-dev/reavion-driver/commit/2ccb87c8a9cbcaabc428243c8e7fbe809ac63709))
* **reavion-driver:** harden Linux AT-SPI and input delivery ([3c63d71](https://github.com/helderperez-dev/reavion-driver/commit/3c63d712a5eab52103112cfab86fc2ca842442a3))
* **reavion-driver:** harden Linux AT-SPI and input delivery ([ea599fd](https://github.com/helderperez-dev/reavion-driver/commit/ea599fdfd76f49f94a3fc4ddb5486dca68a3fbc4))
* **reavion-driver:** harden macOS browser profile setup ([e6643f2](https://github.com/helderperez-dev/reavion-driver/commit/e6643f21e56e7fcee90c503f8fd39c7659d83b43))
* **reavion-driver:** harden macOS input and capture delivery ([4e1aab4](https://github.com/helderperez-dev/reavion-driver/commit/4e1aab42ca4dba143aed20da72878a0ec4290739))
* **reavion-driver:** harden macOS input and capture delivery ([ec908f7](https://github.com/helderperez-dev/reavion-driver/commit/ec908f74cb9f89cb6dbb7af14c18ff71105bd75a))
* **reavion-driver:** harden telemetry release paths ([#2214](https://github.com/helderperez-dev/reavion-driver/issues/2214)) ([06fcc0f](https://github.com/helderperez-dev/reavion-driver/commit/06fcc0fb3bdf5d111069525d146dcb5aa2050e1b))
* **reavion-driver:** harden Windows delivery and GUI validation ([5007f85](https://github.com/helderperez-dev/reavion-driver/commit/5007f85a37b4e29fea1d34c3fcc4590dd21f1e99))
* **reavion-driver:** harden Windows delivery and GUI validation ([3c5c4c1](https://github.com/helderperez-dev/reavion-driver/commit/3c5c4c13552e349653e4d62e1f03e172e5cd5faa))
* **reavion-driver:** Linux list_windows emits `bounds` for cross-platform parity ([#2017](https://github.com/helderperez-dev/reavion-driver/issues/2017)) ([#2018](https://github.com/helderperez-dev/reavion-driver/issues/2018)) ([9e84c1d](https://github.com/helderperez-dev/reavion-driver/commit/9e84c1d8826dc1bfba166456b34f86a9d6212e0d))
* **reavion-driver:** Linux X11 and Wayland convergence ([#2182](https://github.com/helderperez-dev/reavion-driver/issues/2182)) ([51a8e25](https://github.com/helderperez-dev/reavion-driver/commit/51a8e2593fc88efd4f0678d9ab7bbba50c22c91b))
* **reavion-driver:** macOS e2e convergence (conv2 3/7) ([#2183](https://github.com/helderperez-dev/reavion-driver/issues/2183)) ([1d0ff7c](https://github.com/helderperez-dev/reavion-driver/commit/1d0ff7cc3ef7cfcadbf86b8c4b96ab396e319317))
* **reavion-driver:** make install-local TCC grants survive rebuilds and release↔local switches ([#2360](https://github.com/helderperez-dev/reavion-driver/pull/2360)) ([af75ca5](https://github.com/helderperez-dev/reavion-driver/commit/af75ca5e774e01efc0648a408726343e7133ccd1))
* **reavion-driver:** model Linux dialog delivery ([31b4f85](https://github.com/helderperez-dev/reavion-driver/commit/31b4f85755da8d5f5e793745839e2b0639188b22))
* **reavion-driver:** parse uninstall.sh under macOS /bin/bash (bash 3.2) ([#1723](https://github.com/helderperez-dev/reavion-driver/issues/1723)) ([d720891](https://github.com/helderperez-dev/reavion-driver/commit/d72089181db06d8530bf15023757fbc0a8a65c57))
* **reavion-driver:** persist set_config to disk on Windows + Linux ([#2034](https://github.com/helderperez-dev/reavion-driver/issues/2034)) ([e08574c](https://github.com/helderperez-dev/reavion-driver/commit/e08574ca0b3c7ca5c0d9ae33e6ceeac9a45e0d20))
* **reavion-driver:** preserve approved Windows CDP port proof ([2527e77](https://github.com/helderperez-dev/reavion-driver/commit/2527e771ca0ea5aaed0c3d62d52ff4b07322264a))
* **reavion-driver:** preserve cross-platform browser posture ([6ea7806](https://github.com/helderperez-dev/reavion-driver/commit/6ea780690388c33498a8111bc618d7fd0bc8d196))
* **reavion-driver:** report unknown browser tab selection ([6611622](https://github.com/helderperez-dev/reavion-driver/commit/6611622d6c6ef355661c80b6ecae765694088153))
* **reavion-driver:** reset TCC grant on release/local signing transition ([fa309eb](https://github.com/helderperez-dev/reavion-driver/commit/fa309eb5ed0aac1e63c9eaf80dcb2a7749b8b472))
* **reavion-driver:** retain country-only telemetry ([#2217](https://github.com/helderperez-dev/reavion-driver/issues/2217)) ([a705c2a](https://github.com/helderperez-dev/reavion-driver/commit/a705c2ac463392109063c171ca4586a29811103c))
* **reavion-driver:** retry daemon socket writes on EAGAIN, write-side mirror of [#1997](https://github.com/helderperez-dev/reavion-driver/issues/1997) ([#2036](https://github.com/helderperez-dev/reavion-driver/issues/2036)) ([d524d97](https://github.com/helderperez-dev/reavion-driver/commit/d524d97b5a414a9df9d62767d627f24b17bb6353))
* **reavion-driver:** retry transient Windows CDP discovery ([4f5abc2](https://github.com/helderperez-dev/reavion-driver/commit/4f5abc2a231e9a8565326d7f58e78477f09e2666))
* **reavion-driver:** reuse self-signed local identity ([a27753e](https://github.com/helderperez-dev/reavion-driver/commit/a27753e457be1947728fcaa298f077bb306172e9))
* **reavion-driver:** stabilize background browser tabs ([3348fc5](https://github.com/helderperez-dev/reavion-driver/commit/3348fc5778e5b0dfb9402d2c13048c301eda9f57))
* **reavion-driver:** target page JavaScript exactly ([#2166](https://github.com/helderperez-dev/reavion-driver/issues/2166)) ([fb5bc19](https://github.com/helderperez-dev/reavion-driver/commit/fb5bc192a5311d0519447f1d301bdf0b0c93bbb0))
* **reavion-driver:** uninstall.ps1 one-liner crashes iex with "Unexpected attribute 'CmdletBinding'" ([#1750](https://github.com/helderperez-dev/reavion-driver/issues/1750)) ([b8cbe85](https://github.com/helderperez-dev/reavion-driver/commit/b8cbe852b19e8b4de18f967636192e9175c91380))
* **reavion-driver:** wait for background tab input readiness ([a19e909](https://github.com/helderperez-dev/reavion-driver/commit/a19e909db8bfd236c8f71ab56edfd4c3fdc7c807))
* **reavion-driver:** Windows e2e convergence ([#2180](https://github.com/helderperez-dev/reavion-driver/issues/2180)) ([88f88e1](https://github.com/helderperez-dev/reavion-driver/commit/88f88e1b5a31810699781e49f2dd9b9733fbaa82))
* **driver:** remove current autostart services on uninstall ([#2358](https://github.com/helderperez-dev/reavion-driver/issues/2358)) ([4a492f3](https://github.com/helderperez-dev/reavion-driver/commit/4a492f36704eaf063a82eadd0469d08684c7a1f5))
* **driver:** require daemon-backed calls and stabilize E2E ([#2338](https://github.com/helderperez-dev/reavion-driver/issues/2338)) ([9251bb0](https://github.com/helderperez-dev/reavion-driver/commit/9251bb006018d829b452e7109e322eab3f8c9633))
* **get_window_state:** 30s timeout + 2000-node cap for heavy webview apps ([#1754](https://github.com/helderperez-dev/reavion-driver/issues/1754)) ([73a84f5](https://github.com/helderperez-dev/reavion-driver/commit/73a84f5d1f2092fbd58e3a53cd1d61f0f3c3807e))
* **release:** synchronize driver skill versions ([#2362](https://github.com/helderperez-dev/reavion-driver/pull/2362)) ([512e45a](https://github.com/helderperez-dev/reavion-driver/commit/512e45a03fc0b4390f3d29b6443db5821157f7a0))
