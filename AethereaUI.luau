local function GetService(name)local service=game:GetService(name)return
cloneref and cloneref(service)or service end local TweenService=GetService(
'TweenService')local UserInputService=GetService('UserInputService')local
HttpService=GetService('HttpService')local CoreGui=GetService('CoreGui')local
RunService=GetService('RunService')local kTweenFast=TweenInfo.new(0.18,Enum.
EasingStyle.Exponential)local kTweenMid=TweenInfo.new(0.35,Enum.EasingStyle.
Exponential)local kTweenSlow=TweenInfo.new(0.55,Enum.EasingStyle.Exponential)
local kConfigExt='.json'local kBaseFolderName='Aetherea'local kThemeFolder=
'Themes'local kBaseURL='https://aetherea.lol/'local kLucideURL=
[[https://raw.githubusercontent.com/latte-soft/lucide-roblox/refs/heads/master/icons/compiled/48px/]]
local kLucideIcons={[1]='home.png',[2]='user.png',[3]='chevron-down.png',[4]=
'search.png',[5]='x.png',[6]='check.png',[7]='loader-circle.png',[8]='menu.png',
[9]='panel-left.png',[10]='panel-right.png',[11]='layout-dashboard.png',[12]=
'folder.png',[13]='folder-open.png',[14]='settings.png',[15]='cog.png',[16]=
'sliders-horizontal.png',[17]='users.png',[18]='user-plus.png',[19]=
'user-minus.png',[20]='log-in.png',[21]='log-out.png',[22]='filter.png',[23]=
'zoom-in.png',[24]='zoom-out.png',[25]='alert-circle.png',[26]=
'alert-triangle.png',[27]='info.png',[28]='help-circle.png',[29]=
'check-circle.png',[30]='x-circle.png',[31]='minus-circle.png',[32]=
'plus-circle.png',[33]='toggle-left.png',[34]='toggle-right.png',[35]=
'switch-camera.png',[36]='eye.png',[37]='eye-off.png',[38]='lock.png',[39]=
'unlock.png',[40]='file.png',[41]='file-plus.png',[42]='file-minus.png',[43]=
'file-edit.png',[44]='save.png',[45]='download.png',[46]='upload.png',[47]=
'wifi.png',[48]='wifi-off.png',[49]='server.png',[50]='cloud.png',[51]=
'cloud-off.png',[52]='link.png',[53]='unlink.png',[54]='play.png',[55]=
'pause.png',[56]='skip-forward.png',[57]='skip-back.png',[58]='volume.png',[59]=
'volume-x.png',[60]='volume-1.png',[61]='volume-2.png',[62]='star.png',[63]=
'star-off.png',[64]='heart.png',[65]='heart-off.png',[66]='trash.png',[67]=
'refresh-cw.png',[68]='refresh-ccw.png',[69]='clipboard.png',[70]=
'clipboard-copy.png',[71]='clipboard-check.png',[72]='calendar.png',[73]=
'clock.png',[74]='map.png',[75]='flag.png',[76]='sparkles.png',[77]=
'crosshair.png',[78]='view.png',[79]='globe.png',[80]='rainbow.png',[81]=
'smartphone.png',[82]='list.png',[83]='box.png',[84]='circle-dollar-sign.png',[
85]='cat.png'}local kDefaultTheme={FontRegular=Font.new(
'rbxasset://fonts/families/Montserrat.json',Enum.FontWeight.Regular,Enum.
FontStyle.Normal),FontSemiBold=Font.new(
'rbxasset://fonts/families/Montserrat.json',Enum.FontWeight.SemiBold,Enum.
FontStyle.Normal),Background=Color3.fromRGB(28,28,30),Stroke=Color3.fromRGB(38,
38,40),Text=Color3.fromRGB(240,240,240),SubText=Color3.fromRGB(178,178,178),
TextEnabled=Color3.fromRGB(181,126,220),SectionBackground=Color3.fromRGB(35,35,
37),SectionStroke=Color3.fromRGB(35,35,37),SectionTopbar=Color3.fromRGB(32,32,34
),ElementBackground=Color3.fromRGB(38,38,40),ElementStroke=Color3.fromRGB(42,42,
44),ElementSelected=Color3.fromRGB(44,44,46),TabBackgroundSelected=Color3.
fromRGB(50,50,52),TabText=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.
fromRGB(181,126,220)),ColorSequenceKeypoint.new(1,Color3.fromRGB(181,126,220))})
,TabTextSelected=ColorSequence.new({ColorSequenceKeypoint.new(0,Color3.fromRGB(
106,13,173)),ColorSequenceKeypoint.new(0.5,Color3.fromRGB(181,126,220)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(106,13,173))}),TabStroke=Color3.
fromRGB(54,54,56),ButtonBackground=Color3.fromRGB(38,38,40),ButtonStroke=Color3.
fromRGB(42,42,44),ButtonHoverBackground=Color3.fromRGB(44,44,46),ToggleEnabled=
Color3.fromRGB(106,13,173),ToggleDisabled=Color3.fromRGB(100,100,102),
ToggleEnabledStroke=Color3.fromRGB(131,38,198),ToggleDisabledStroke=Color3.
fromRGB(125,125,127),ToggleHoverEnabled=Color3.fromRGB(133,40,200),
ToggleHoverDisabled=Color3.fromRGB(127,127,129),SliderBackground=Color3.fromRGB(
38,38,40),SliderFill=Color3.fromRGB(106,13,173),SliderStroke=Color3.fromRGB(42,
42,44),SliderHoverBackground=Color3.fromRGB(44,44,46),SliderHoverFill=Color3.
fromRGB(133,40,200),DropdownBackground=Color3.fromRGB(38,38,40),DropdownStroke=
Color3.fromRGB(42,42,44),DropdownHoverBackground=Color3.fromRGB(44,44,46),
DropdownSelected=Color3.fromRGB(48,48,50),DropdownUnselected=Color3.fromRGB(38,
38,40),InputBackground=Color3.fromRGB(38,38,40),InputStroke=Color3.fromRGB(42,42
,44),InputStrokeSelected=Color3.fromRGB(44,44,46),KeybindBackground=Color3.
fromRGB(38,38,40),KeybindStroke=Color3.fromRGB(42,42,44),KeybindStrokeSelected=
Color3.fromRGB(44,44,46),ColorPickerBackground=Color3.fromRGB(38,38,40),
ColorPickerStroke=Color3.fromRGB(42,42,44),ColorPickerHoverBackground=Color3.
fromRGB(44,44,46),ColorPickerPanel=Color3.fromRGB(38,38,40),RadioEnabled=Color3.
fromRGB(106,13,173),RadioDisabled=Color3.fromRGB(100,100,102),RadioEnabledStroke
=Color3.fromRGB(131,38,198),RadioDisabledStroke=Color3.fromRGB(125,125,127),
RadioHoverEnabled=Color3.fromRGB(133,40,200),RadioHoverDisabled=Color3.fromRGB(
127,127,129),NotificationTopbar=Color3.fromRGB(32,32,34),NotificationBackground=
Color3.fromRGB(35,35,37),NotificationStroke=Color3.fromRGB(35,35,37),AccentColor
=Color3.fromRGB(50,138,220),DangerColor=Color3.fromRGB(214,60,60),SuccessColor=
Color3.fromRGB(60,200,100),WarningColor=Color3.fromRGB(220,160,0)}local function
GetProtectedParent()if gethui then return gethui()end local roblox_gui=CoreGui:
FindFirstChild('RobloxGui')return roblox_gui or CoreGui end local kAssetCache={}
local Assets={}local function EnsureFolder(path)if isfolder and not isfolder(
path)then makefolder(path)end end function Assets.Register(id,url)kAssetCache[
tostring(id)]={url=url,uri=nil}end function Assets.Preload()local has_gca=type(
getcustomasset)=='function'local has_fs=type(writefile)=='function'and type(
isfile)=='function'EnsureFolder(kBaseFolderName)EnsureFolder(kBaseFolderName..
'/assets')local pending=0 local done=Instance.new('BindableEvent')for id_str,
entry in pairs(kAssetCache)do if entry.uri then continue end pending+=1 task.
spawn(function()local file_path=kBaseFolderName..'/assets/'..id_str..'.png'if
has_gca and has_fs then if not isfile(file_path)then local ok,body=pcall(game.
HttpGet,game,entry.url)if ok and#body>0 then writefile(file_path,body)end end if
isfile(file_path)then local ok,uri=pcall(getcustomasset,file_path)entry.uri=ok
and uri or('rbxassetid://'..id_str)else entry.uri='rbxassetid://'..id_str end
else entry.uri='rbxassetid://'..id_str end pending-=1 if pending==0 then done:
Fire()end end)end if pending>0 then done.Event:Wait()end done:Destroy()end
function Assets.Get(id)local entry=kAssetCache[tostring(id)]if not entry then
return''end return entry.uri or('rbxassetid://'..id)end local SequenceTween={}
SequenceTween.__index=SequenceTween local function LerpNumberSequence(a,b,alpha)
local keypoints={}local count=math.max(#a.Keypoints,#b.Keypoints)for i=1,count
do local ak=a.Keypoints[math.min(i,#a.Keypoints)]local bk=b.Keypoints[math.min(i
,#b.Keypoints)]local time=ak.Time+(bk.Time-ak.Time)*alpha local value=ak.Value+(
bk.Value-ak.Value)*alpha local envelope=(ak.Envelope or 0)+(((bk.Envelope or 0)-
(ak.Envelope or 0))*alpha)table.insert(keypoints,NumberSequenceKeypoint.new(time
,value,envelope))end return NumberSequence.new(keypoints)end local function
LerpColorSequence(a,b,alpha)local keypoints={}local count=math.max(#a.Keypoints,
#b.Keypoints)for i=1,count do local ak=a.Keypoints[math.min(i,#a.Keypoints)]
local bk=b.Keypoints[math.min(i,#b.Keypoints)]local time=ak.Time+(bk.Time-ak.
Time)*alpha local value=ak.Value:Lerp(bk.Value,alpha)table.insert(keypoints,
ColorSequenceKeypoint.new(time,value))end return ColorSequence.new(keypoints)end
function SequenceTween.new(object,property,goalSequence,tweenInfo)local self=
setmetatable({},SequenceTween)self.Object=object self.Property=property self.
Goal=goalSequence self.TweenInfo=tweenInfo self._value=Instance.new(
'NumberValue')self._value.Value=0 self._start=object[property]self._connection=
self._value:GetPropertyChangedSignal('Value'):Connect(function()local alpha=self
._value.Value if typeof(self._start)=='NumberSequence'then object[property]=
LerpNumberSequence(self._start,goalSequence,alpha)elseif typeof(self._start)==
'ColorSequence'then object[property]=LerpColorSequence(self._start,goalSequence,
alpha)else error('Unsupported sequence type: '..typeof(self._start))end end)self
._tween=TweenService:Create(self._value,tweenInfo,{Value=1})self._tween.
Completed:Connect(function()self:Destroy()end)return self end function
SequenceTween:Play()self._tween:Play()end function SequenceTween:Pause()self.
_tween:Pause()end function SequenceTween:Cancel()self._tween:Cancel()self:
Destroy()end function SequenceTween:Destroy()if self._connection then self.
_connection:Disconnect()self._connection=nil end if self._value then self._value
:Destroy()self._value=nil end end local DropdownManager={Current=nil,Layer=nil}
local function GetDropdownLayer()if DropdownManager.Layer and DropdownManager.
Layer.Parent then return DropdownManager.Layer end local root=
GetProtectedParent():FindFirstChild('aeui')if not root then return nil end local
layer=root:FindFirstChild('DropdownLayer')if not layer then layer=Instance.new(
'Frame')layer.Name='DropdownLayer'layer.BackgroundTransparency=1 layer.Size=
UDim2.fromScale(1,1)layer.ZIndex=9999 layer.Parent=root end DropdownManager.
Layer=layer return layer end local function GetColorPickerLayer()if
DropdownManager.Layer and DropdownManager.Layer.Parent then return
DropdownManager.Layer end return GetDropdownLayer()end local Util={}function
Util.Tween(inst,info,props)TweenService:Create(inst,info,props):Play()end
function Util.SafeCall(fn,...)local ok,_=pcall(fn,...)return ok end function
Util.Merge(base,patch)patch=patch or{}for k,v in pairs(base)do if patch[k]==nil
then patch[k]=v end end return patch end function Util.RandomName()local pool=
[[abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789]]local t=table.
create(16)for i=1,16 do t[i]=pool:sub(math.random(1,#pool),math.random(1,#pool))
end return table.concat(t)end function Util.ThemeDescendants(root,theme)for _,
obj in ipairs(root:GetDescendants())do if obj:IsA('TextLabel')or obj:IsA(
'TextBox')or obj:IsA('TextButton')then obj.TextColor3=theme.Text end end end
function Util.UDim2ToTable(u)return{XS=u.X.Scale,XO=u.X.Offset,YS=u.Y.Scale,YO=u
.Y.Offset}end function Util.TableToUDim2(t)if type(t)~='table'then return nil
end return UDim2.new(t.XS or 0,t.XO or 0,t.YS or 0,t.YO or 0)end function Util.
SerializeThemeValue(v)local t=typeof(v)if t=='Color3'then return{__type='Color3'
,R=math.round(v.R*255),G=math.round(v.G*255),B=math.round(v.B*255)}elseif t==
'ColorSequence'then local keypoints={}for _,kp in ipairs(v.Keypoints)do
keypoints[#keypoints+1]={Time=kp.Time,R=math.round(kp.Value.R*255),G=math.round(
kp.Value.G*255),B=math.round(kp.Value.B*255)}end return{__type='ColorSequence',
Keypoints=keypoints}elseif t=='Font'then return{__type='Font',Family=v.Family,
Weight=v.Weight.Name,Style=v.Style.Name}end return v end function Util.
DeserializeThemeValue(v)if type(v)~='table'or not v.__type then return v end if
v.__type=='Color3'then return Color3.fromRGB(v.R or 255,v.G or 255,v.B or 255)
elseif v.__type=='ColorSequence'then local keypoints={}for _,kp in ipairs(v.
Keypoints or{})do keypoints[#keypoints+1]=ColorSequenceKeypoint.new(kp.Time,
Color3.fromRGB(kp.R or 255,kp.G or 255,kp.B or 255))end if#keypoints==0 then
return nil end return ColorSequence.new(keypoints)elseif v.__type=='Font'then
local weight=Enum.FontWeight[v.Weight]or Enum.FontWeight.Regular local style=
Enum.FontStyle[v.Style]or Enum.FontStyle.Normal return Font.new(v.Family,weight,
style)end return v end local function MakeDraggable(frame,handle,onDragEnd)local
dragging=false local drag_start=Vector3.zero local start_pos=UDim2.new()local
active_tween local last_target=frame.Position handle.InputBegan:Connect(function
(input)local t=input.UserInputType if t~=Enum.UserInputType.MouseButton1 and t~=
Enum.UserInputType.Touch then return end dragging=true drag_start=input.Position
start_pos=frame.Position end)local changed=UserInputService.InputChanged:
Connect(function(input)if not dragging then return end local t=input.
UserInputType if t~=Enum.UserInputType.MouseMovement and t~=Enum.UserInputType.
Touch then return end local d=input.Position-drag_start local target_pos=UDim2.
new(start_pos.X.Scale,start_pos.X.Offset+d.X,start_pos.Y.Scale,start_pos.Y.
Offset+d.Y)last_target=target_pos if active_tween then active_tween:Cancel()
active_tween=nil end active_tween=TweenService:Create(frame,kTweenMid,{Position=
target_pos})active_tween:Play()end)local ended=UserInputService.InputEnded:
Connect(function(input)local t=input.UserInputType if t~=Enum.UserInputType.
MouseButton1 and t~=Enum.UserInputType.Touch then return end if not dragging
then return end dragging=false active_tween=nil if onDragEnd then Util.SafeCall(
onDragEnd,last_target)end end)frame.Destroying:Connect(function()changed:
Disconnect()ended:Disconnect()end)end local NotificationManager={}
NotificationManager.__index=NotificationManager function NotificationManager.New
(window)local self=setmetatable({window=window},NotificationManager)local
container=Instance.new('CanvasGroup')container.Name=Util.RandomName()container.
AnchorPoint=Vector2.new(1,1)container.BackgroundTransparency=1 container.
BorderSizePixel=0 container.Position=UDim2.new(1,0,1,0)container.Size=UDim2.new(
0,250,0,400)container.Parent=window.screen_gui self.container=container local
list_layout=Instance.new('UIListLayout')list_layout.Name=Util.RandomName()
list_layout.Padding=UDim.new(0,5)list_layout.FillDirection=Enum.FillDirection.
Vertical list_layout.SortOrder=Enum.SortOrder.LayoutOrder list_layout.
HorizontalAlignment=Enum.HorizontalAlignment.Center list_layout.
VerticalAlignment=Enum.VerticalAlignment.Bottom list_layout.Parent=container
local padding=Instance.new('UIPadding')padding.Name=Util.RandomName()padding.
PaddingBottom=UDim.new(0,5)padding.PaddingLeft=UDim.new(0,5)padding.PaddingRight
=UDim.new(0,5)padding.PaddingTop=UDim.new(0,5)padding.Parent=container return
self end function NotificationManager:Push(data)local title=data.Title or
'Notification'local content=data.Content or''local icon=data.Icon or nil local
style=data.Type local duration=data.Duration or math.clamp(#content*0.07+2.5,3,
10)local window=self.window task.spawn(function()local notification=Instance.
new('CanvasGroup')notification.Name=Util.RandomName()notification.
GroupTransparency=1 notification.BorderSizePixel=0 notification.Size=UDim2.new(0
,0,0,50)notification.Parent=self.container window:RegisterThemeObject(
notification,'BackgroundColor3','NotificationBackground')local border=Instance.
new('UIStroke')border.Name=Util.RandomName()border.Thickness=1 border.Parent=
notification window:RegisterThemeObject(border,'Color','NotificationStroke')
local corner_radius=Instance.new('UICorner')corner_radius.Name=Util.RandomName()
corner_radius.CornerRadius=UDim.new(0,8)corner_radius.Parent=notification local
list_layout=Instance.new('UIListLayout')list_layout.Name=Util.RandomName()
list_layout.Padding=UDim.new(0,0)list_layout.FillDirection=Enum.FillDirection.
Vertical list_layout.SortOrder=Enum.SortOrder.LayoutOrder list_layout.
HorizontalAlignment=Enum.HorizontalAlignment.Left list_layout.Parent=
notification local topbar=Instance.new('Frame')topbar.Name=Util.RandomName()
topbar.BorderSizePixel=0 topbar.LayoutOrder=0 topbar.Size=UDim2.new(1,0,0,20)
topbar.ClipsDescendants=true topbar.Parent=notification window:
RegisterThemeObject(topbar,'BackgroundColor3','NotificationTopbar')local
list_layout_2=Instance.new('UIListLayout')list_layout_2.Name=Util.RandomName()
list_layout_2.Padding=UDim.new(0,5)list_layout_2.FillDirection=Enum.
FillDirection.Horizontal list_layout_2.SortOrder=Enum.SortOrder.LayoutOrder
list_layout_2.VerticalAlignment=Enum.VerticalAlignment.Center list_layout_2.
Parent=topbar local padding=Instance.new('UIPadding')padding.Name=Util.
RandomName()padding.PaddingLeft=UDim.new(0,5)padding.PaddingRight=UDim.new(0,5)
padding.Parent=topbar if icon then local icon_label=Instance.new('ImageLabel')
icon_label.Name=Util.RandomName()icon_label.BackgroundTransparency=1 icon_label.
BorderSizePixel=0 icon_label.LayoutOrder=0 icon_label.Size=UDim2.new(0,14,0,14)
icon_label.Image=Assets.Get(icon)icon_label.Parent=topbar local constraint=
Instance.new('UIAspectRatioConstraint')constraint.Name=Util.RandomName()
constraint.AspectRatio=1 constraint.Parent=icon_label local gradient=Instance.
new('UIGradient')gradient.Name=Util.RandomName()gradient.Rotation=90 gradient.
Parent=icon_label window:RegisterThemeObject(gradient,'Color','TabText')end
local title_label=Instance.new('TextLabel')title_label.Name=Util.RandomName()
title_label.AnchorPoint=Vector2.new(0,1)title_label.BackgroundTransparency=1
title_label.BorderSizePixel=0 title_label.LayoutOrder=1 title_label.Size=UDim2.
new(0,150,0,20)title_label.Text=title title_label.TextSize=14 title_label.
TextTruncate=Enum.TextTruncate.AtEnd title_label.TextXAlignment=Enum.
TextXAlignment.Left title_label.Parent=topbar window:RegisterThemeObject(
title_label,'FontFace','FontSemiBold')window:RegisterThemeObject(title_label,
'TextColor3','Text')local content_container=Instance.new('Frame')
content_container.Name=Util.RandomName()content_container.BackgroundTransparency
=1 content_container.BorderSizePixel=0 content_container.Size=UDim2.new(1,0,1,-
22)content_container.LayoutOrder=1 content_container.Parent=notification local
padding_2=Instance.new('UIPadding')padding_2.Name=Util.RandomName()padding_2.
PaddingBottom=UDim.new(0,5)padding_2.PaddingLeft=UDim.new(0,5)padding_2.
PaddingRight=UDim.new(0,5)padding_2.PaddingTop=UDim.new(0,5)padding_2.Parent=
content_container local content_label=Instance.new('TextLabel')content_label.
Name=Util.RandomName()content_label.BackgroundTransparency=1 content_label.
BorderSizePixel=0 content_label.Size=UDim2.new(1,0,1,0)content_label.Text=
content content_label.TextSize=14 content_label.TextTruncate=Enum.TextTruncate.
AtEnd content_label.TextXAlignment=Enum.TextXAlignment.Left content_label.
TextYAlignment=Enum.TextYAlignment.Top content_label.Parent=content_container
window:RegisterThemeObject(content_label,'FontFace','FontRegular')window:
RegisterThemeObject(content_label,'TextColor3','Text')local progress=Instance.
new('Frame')progress.Name=Util.RandomName()progress.BorderSizePixel=0 progress.
Size=UDim2.new(0,0,0,2)progress.LayoutOrder=2 progress.Parent=notification if
style=='Success'then window:RegisterThemeObject(progress,'BackgroundColor3',
'SuccessColor')elseif style=='Warning'then window:RegisterThemeObject(progress,
'BackgroundColor3','WarningColor')elseif style=='Error'then window:
RegisterThemeObject(progress,'BackgroundColor3','DangerColor')else window:
RegisterThemeObject(progress,'BackgroundColor3','AccentColor')end Util.Tween(
notification,kTweenMid,{GroupTransparency=0,Size=UDim2.new(1,0,0,50)})Util.
Tween(progress,TweenInfo.new(duration,Enum.EasingStyle.Linear),{Size=UDim2.new(1
,0,0,2)})task.wait(duration)Util.Tween(notification,kTweenMid,{GroupTransparency
=1,Size=UDim2.new(0,0,0,50)})task.wait(kTweenMid.Time)notification:Destroy()end)
end local KeybindsWindow={}KeybindsWindow.__index=KeybindsWindow function
KeybindsWindow.New(window)local self=setmetatable({window=window,entries={},
visible=false},KeybindsWindow)local frame=Instance.new('CanvasGroup')frame.Name=
Util.RandomName()frame.AnchorPoint=Vector2.new(0,0.5)frame.BorderSizePixel=0
frame.Position=(window._loaded_positions and Util.TableToUDim2(window.
_loaded_positions.Keybinds))or UDim2.new(0,20,0.5,0)frame.Size=UDim2.new(0,0,0,0
)frame.AutomaticSize=Enum.AutomaticSize.XY frame.ClipsDescendants=true frame.
GroupTransparency=1 frame.Visible=false frame.Parent=window.screen_gui self.
frame=frame window:RegisterThemeObject(frame,'BackgroundColor3',
'NotificationBackground')local border=Instance.new('UIStroke')border.Name=Util.
RandomName()border.Thickness=1 border.Parent=frame self.border=border window:
RegisterThemeObject(border,'Color','NotificationStroke')local corner_radius=
Instance.new('UICorner')corner_radius.Name=Util.RandomName()corner_radius.
CornerRadius=UDim.new(0,8)corner_radius.Parent=frame local list_layout=Instance.
new('UIListLayout')list_layout.Name=Util.RandomName()list_layout.Padding=UDim.
new(0,0)list_layout.FillDirection=Enum.FillDirection.Vertical list_layout.
SortOrder=Enum.SortOrder.LayoutOrder list_layout.Parent=frame local topbar=
Instance.new('Frame')topbar.Name=Util.RandomName()topbar.BorderSizePixel=0
topbar.LayoutOrder=0 topbar.Size=UDim2.new(1,0,0,22)topbar.ClipsDescendants=true
topbar.Parent=frame self.topbar=topbar window:RegisterThemeObject(topbar,
'BackgroundColor3','NotificationTopbar')local list_layout_2=Instance.new(
'UIListLayout')list_layout_2.Name=Util.RandomName()list_layout_2.Padding=UDim.
new(0,5)list_layout_2.FillDirection=Enum.FillDirection.Horizontal list_layout_2.
SortOrder=Enum.SortOrder.LayoutOrder list_layout_2.VerticalAlignment=Enum.
VerticalAlignment.Center list_layout_2.Parent=topbar local topbar_padding=
Instance.new('UIPadding')topbar_padding.Name=Util.RandomName()topbar_padding.
PaddingLeft=UDim.new(0,8)topbar_padding.PaddingRight=UDim.new(0,8)topbar_padding
.Parent=topbar local title_label=Instance.new('TextLabel')title_label.Name=Util.
RandomName()title_label.BackgroundTransparency=1 title_label.BorderSizePixel=0
title_label.LayoutOrder=0 title_label.AutomaticSize=Enum.AutomaticSize.X
title_label.Size=UDim2.new(0,0,1,0)title_label.Text='Keybinds'title_label.
TextSize=16 title_label.TextTruncate=Enum.TextTruncate.AtEnd title_label.
TextXAlignment=Enum.TextXAlignment.Left title_label.Parent=topbar window:
RegisterThemeObject(title_label,'FontFace','FontSemiBold')window:
RegisterThemeObject(title_label,'TextColor3','Text')local content=Instance.new(
'Frame')content.Name=Util.RandomName()content.BackgroundTransparency=1 content.
BorderSizePixel=0 content.AutomaticSize=Enum.AutomaticSize.XY content.
LayoutOrder=1 content.Size=UDim2.new(0,0,0,0)content.Parent=frame self.content=
content local content_padding=Instance.new('UIPadding')content_padding.Name=Util
.RandomName()content_padding.PaddingTop=UDim.new(0,5)content_padding.
PaddingBottom=UDim.new(0,5)content_padding.PaddingLeft=UDim.new(0,8)
content_padding.PaddingRight=UDim.new(0,8)content_padding.Parent=content local
content_layout=Instance.new('UIListLayout')content_layout.Name=Util.RandomName()
content_layout.Padding=UDim.new(0,3)content_layout.FillDirection=Enum.
FillDirection.Vertical content_layout.SortOrder=Enum.SortOrder.LayoutOrder
content_layout.Parent=content MakeDraggable(frame,topbar,function()if window.
_QueueAutoSave then window:_QueueAutoSave()end end)return self end function
KeybindsWindow:_FormatText(ctrl)return string.format('[%s] %s (%s)',ctrl.
CurrentKeybind,ctrl.Name,ctrl.Hold and'Hold'or'Toggle')end function
KeybindsWindow:_UpdateVisibility()if not self.visible then return end local
count=0 for _ in pairs(self.entries)do count+=1 end if count>0 then if not self.
frame.Visible then self.frame.Visible=true Util.Tween(self.frame,kTweenMid,{
GroupTransparency=0})end else if self.frame.Visible then local hide_tween=
TweenService:Create(self.frame,kTweenMid,{GroupTransparency=1})hide_tween:Play()
hide_tween.Completed:Connect(function()local still_empty=true for _ in pairs(
self.entries)do still_empty=false break end if still_empty then self.frame.
Visible=false end end)end end end function KeybindsWindow:Hide()self.visible=
false Util.Tween(self.border,kTweenMid,{Transparency=1})local hide_tween=
TweenService:Create(self.frame,kTweenMid,{GroupTransparency=1})hide_tween:Play()
task.delay(kTweenMid.Time,function()self.frame.Visible=false end)end function
KeybindsWindow:Show()self.frame.Visible=true Util.Tween(self.border,kTweenMid,{
Transparency=0})local show_tween=TweenService:Create(self.frame,kTweenMid,{
GroupTransparency=0})show_tween:Play()task.delay(kTweenMid.Time,function()self.
visible=true end)end function KeybindsWindow:Add(ctrl)if self.entries[ctrl]then
return end local row=Instance.new('TextLabel')row.Name=Util.RandomName()row.
BackgroundTransparency=1 row.BorderSizePixel=0 row.AutomaticSize=Enum.
AutomaticSize.X row.Size=UDim2.new(0,0,0,16)row.LayoutOrder=#self.content:
GetChildren()row.Text=self:_FormatText(ctrl)row.TextSize=14 row.TextWrapped=true
row.TextXAlignment=Enum.TextXAlignment.Left row.Parent=self.content self.window:
RegisterThemeObject(row,'FontFace','FontRegular')self.window:
RegisterThemeObject(row,'TextColor3','Text')self.entries[ctrl]=row local
original_set=ctrl.Set ctrl.Set=function(self_ctrl,key_name)original_set(
self_ctrl,key_name)if row and row.Parent then row.Text=self:_FormatText(
self_ctrl)end end local original_setmode=ctrl.SetMode ctrl.SetMode=function(
self_ctrl,mode)original_setmode(self_ctrl,mode)if row and row.Parent then row.
Text=self:_FormatText(self_ctrl)end end local function UpdateState(pressed)Util.
Tween(row,kTweenSlow,{TextColor3=pressed and self.window.theme.TextEnabled or
self.window.theme.Text})end UpdateState(ctrl.Pressed)ctrl.OnPressedChanged=
UpdateState if ctrl.frame then ctrl.frame.Destroying:Connect(function()self:
Remove(ctrl)end)end self:_UpdateVisibility()end function KeybindsWindow:Remove(
ctrl)local row=self.entries[ctrl]if row then row:Destroy()self.entries[ctrl]=nil
end self:_UpdateVisibility()end local Config={}local Theme={}local Elements={}
function Elements.CreateButton(section,container,data)local name=data.Name or
'Button'local desc=data.Description local callback=data.Callback or function()
end local style=data.Style local height=desc and 40 or 25 local window=section.
tab.window local control={Name=name,Type='Button',section=section}local frame=
Instance.new('Frame')frame.Name=Util.RandomName()frame.BorderSizePixel=0 frame.
Size=UDim2.new(1,0,0,height)frame.LayoutOrder=#container:GetChildren()frame.
ClipsDescendants=true frame.Parent=container control.frame=frame if style==
'Danger'then window:RegisterThemeObject(frame,'BackgroundColor3','DangerColor')
else window:RegisterThemeObject(frame,'BackgroundColor3','ButtonBackground')end
local stroke=Instance.new('UIStroke')stroke.Name=Util.RandomName()stroke.
Thickness=1 stroke.Parent=frame window:RegisterThemeObject(stroke,'Color',
'ButtonStroke')local corner=Instance.new('UICorner')corner.Name=Util.RandomName(
)corner.CornerRadius=UDim.new(0,4)corner.Parent=frame local interact=Instance.
new('TextButton')interact.Name=Util.RandomName()interact.BackgroundTransparency=
1 interact.BorderSizePixel=0 interact.Size=UDim2.new(1,0,1,0)interact.Text=''
interact.TextTransparency=1 interact.ZIndex=10 interact.Parent=frame local
title_label=Instance.new('TextLabel')title_label.Name=Util.RandomName()
title_label.BackgroundTransparency=1 title_label.BorderSizePixel=0 title_label.
Position=UDim2.new(0,10,0,0)title_label.Size=UDim2.new(1,-14,1,0)title_label.
Text=name title_label.TextSize=12 title_label.TextTruncate=Enum.TextTruncate.
AtEnd title_label.TextXAlignment=Enum.TextXAlignment.Left title_label.Parent=
frame window:RegisterThemeObject(title_label,'FontFace','FontSemiBold')window:
RegisterThemeObject(title_label,'TextColor3','Text')if desc then local
desc_label=Instance.new('TextLabel')desc_label.Name=Util.RandomName()desc_label.
BackgroundTransparency=1 desc_label.BorderSizePixel=0 desc_label.Position=UDim2.
new(0,10,0,14)desc_label.Size=UDim2.new(1,-14,0,14)desc_label.Text=desc
desc_label.TextSize=10 desc_label.TextTruncate=Enum.TextTruncate.AtEnd
desc_label.TextXAlignment=Enum.TextXAlignment.Left desc_label.Parent=frame
window:RegisterThemeObject(desc_label,'FontFace','FontRegular')window:
RegisterThemeObject(desc_label,'TextColor3','SubText')end interact.
MouseButton1Click:Connect(function()Util.SafeCall(callback)end)interact.
MouseEnter:Connect(function()Util.Tween(frame,kTweenSlow,{BackgroundColor3=
window.theme.ButtonHoverBackground})end)interact.MouseLeave:Connect(function()
Util.Tween(frame,kTweenSlow,{BackgroundColor3=window.theme.ButtonBackground})end
)function control:SetEnabled(state)interact.Active=state Util.Tween(frame,
kTweenSlow,{BackgroundTransparency=state and 0 or 0.4})end return control end
function Elements.CreateToggle(section,container,data)local name=data.Name or
'Toggle'local value=data.CurrentValue or false local callback=data.Callback or
function()end local desc=data.Description local height=desc and 40 or 25 local
window=section.tab.window local control={Name=name,CurrentValue=value,Type=
'Toggle',section=section}local frame=Instance.new('Frame')frame.Name=Util.
RandomName()frame.BackgroundTransparency=1 frame.BorderSizePixel=0 frame.Size=
UDim2.new(1,0,0,height)frame.LayoutOrder=#container:GetChildren()frame.
ClipsDescendants=true frame.Parent=container control.frame=frame local interact=
Instance.new('TextButton')interact.Name=Util.RandomName()interact.
BackgroundTransparency=1 interact.BorderSizePixel=0 interact.Size=UDim2.new(1,0,
1,0)interact.Text=''interact.TextTransparency=1 interact.ZIndex=10 interact.
Parent=frame local title_label=Instance.new('TextLabel')title_label.Name=Util.
RandomName()title_label.BackgroundTransparency=1 title_label.BorderSizePixel=0
title_label.Position=UDim2.new(0,10,0,0)title_label.Size=UDim2.new(1,-14,1,0)
title_label.Text=name title_label.TextSize=12 title_label.TextTruncate=Enum.
TextTruncate.AtEnd title_label.TextXAlignment=Enum.TextXAlignment.Left
title_label.Parent=frame window:RegisterThemeObject(title_label,'FontFace',
'FontSemiBold')window:RegisterThemeObject(title_label,'TextColor3','Text')local
switch=Instance.new('Frame')switch.Name=Util.RandomName()switch.AnchorPoint=
Vector2.new(1,0.5)switch.BorderSizePixel=0 switch.Position=UDim2.new(1,-8,0.5,0)
switch.Size=UDim2.new(0,34,0,14)switch.ZIndex=2 switch.Parent=frame if value
then window:RegisterThemeObject(switch,'BackgroundColor3','ToggleEnabled')else
window:RegisterThemeObject(switch,'BackgroundColor3','ToggleDisabled')end local
corner_radius=Instance.new('UICorner')corner_radius.Name=Util.RandomName()
corner_radius.CornerRadius=UDim.new(1,0)corner_radius.Parent=switch local border
=Instance.new('UIStroke')border.Name=Util.RandomName()border.Thickness=1 border.
Parent=switch if value then window:RegisterThemeObject(border,'Color',
'ToggleEnabledStroke')else window:RegisterThemeObject(border,'Color',
'ToggleDisabledStroke')end local knob=Instance.new('Frame')knob.Name=Util.
RandomName()knob.AnchorPoint=Vector2.new(0.5,0.5)knob.BackgroundColor3=Color3.
new(1,1,1)knob.BorderSizePixel=0 knob.Position=value and UDim2.new(0,34-7,0.5,0)
or UDim2.new(0,7,0.5,0)knob.Size=UDim2.new(0,10,0,10)knob.ZIndex=3 knob.Parent=
switch local corner_radius_2=Instance.new('UICorner')corner_radius_2.Name=Util.
RandomName()corner_radius_2.CornerRadius=UDim.new(1,0)corner_radius_2.Parent=
knob if desc then local desc_label=Instance.new('TextLabel')desc_label.Name=Util
.RandomName()desc_label.BackgroundTransparency=1 desc_label.BorderSizePixel=0
desc_label.Position=UDim2.new(0,10,0,14)desc_label.Size=UDim2.new(1,-14,0,14)
desc_label.Text=desc desc_label.TextSize=10 desc_label.TextTruncate=Enum.
TextTruncate.AtEnd desc_label.TextXAlignment=Enum.TextXAlignment.Left desc_label
.Parent=frame window:RegisterThemeObject(desc_label,'FontFace','FontRegular')
window:RegisterThemeObject(desc_label,'TextColor3','SubText')end local function
ApplyVisual(v)Util.Tween(switch,kTweenSlow,{BackgroundColor3=v and window.theme.
ToggleEnabled or window.theme.ToggleDisabled})Util.Tween(border,kTweenSlow,{
Color=v and window.theme.ToggleEnabledStroke or window.theme.
ToggleDisabledStroke})Util.Tween(knob,kTweenSlow,{Position=v and UDim2.new(0,27,
0.5,0)or UDim2.new(0,7,0.5,0)})end function control:Set(v)control.CurrentValue=v
ApplyVisual(v)Util.SafeCall(callback,v)end interact.MouseButton1Click:Connect(
function()control:Set(not control.CurrentValue)end)interact.MouseEnter:Connect(
function()Util.Tween(switch,kTweenSlow,{BackgroundColor3=control.CurrentValue
and window.theme.ToggleHoverEnabled or window.theme.ToggleHoverDisabled})end)
interact.MouseLeave:Connect(function()Util.Tween(switch,kTweenSlow,{
BackgroundColor3=control.CurrentValue and window.theme.ToggleEnabled or window.
theme.ToggleDisabled})end)ApplyVisual(value)return control end function Elements
.CreateSlider(section,container,data)local name=data.Name or'Slider'local range=
data.Range or{0,100}local increment=data.Increment or 1 local suffix=data.Suffix
or''local value=math.clamp(data.CurrentValue or range[1],range[1],range[2])local
callback=data.Callback or function()end local desc=data.Description local height
=desc and 40 or 25 local window=section.tab.window local function Snap(v)local _
,_,decimals=tostring(increment):find('%.(%d+)')local places=decimals and#
decimals or 0 local factor=10^places return math.floor(v*factor+0.5)/factor end
local control={Name=name,CurrentValue=Snap(value),Type='Slider',section=section}
local frame=Instance.new('Frame')frame.Name=Util.RandomName()frame.
BackgroundTransparency=1 frame.BorderSizePixel=0 frame.Size=UDim2.new(1,0,0,
height)frame.LayoutOrder=#container:GetChildren()frame.ClipsDescendants=true
frame.Parent=container control.frame=frame local interact=Instance.new(
'TextButton')interact.Name=Util.RandomName()interact.BackgroundTransparency=1
interact.BorderSizePixel=0 interact.Size=UDim2.new(1,0,1,0)interact.Text=''
interact.TextTransparency=1 interact.ZIndex=10 interact.Parent=frame local
title_label=Instance.new('TextLabel')title_label.Name=Util.RandomName()
title_label.BackgroundTransparency=1 title_label.BorderSizePixel=0 title_label.
Position=UDim2.new(0,10,0,0)title_label.Size=UDim2.new(1,-60,0,13)title_label.
Text=name title_label.TextSize=11 title_label.TextTruncate=Enum.TextTruncate.
AtEnd title_label.TextXAlignment=Enum.TextXAlignment.Left title_label.Parent=
frame window:RegisterThemeObject(title_label,'FontFace','FontSemiBold')window:
RegisterThemeObject(title_label,'TextColor3','Text')local value_label=Instance.
new('TextLabel')value_label.Name=Util.RandomName()value_label.
BackgroundTransparency=1 value_label.BorderSizePixel=0 value_label.AnchorPoint=
Vector2.new(1,0)value_label.Position=UDim2.new(1,-8,0,0)value_label.Size=UDim2.
new(0,60,0,13)value_label.Text=tostring(value)..suffix value_label.TextSize=11
value_label.TextXAlignment=Enum.TextXAlignment.Right value_label.ZIndex=2
value_label.Parent=frame window:RegisterThemeObject(value_label,'FontFace',
'FontSemiBold')window:RegisterThemeObject(value_label,'TextColor3','SubText')
local track=Instance.new('Frame')track.Name=Util.RandomName()track.AnchorPoint=
Vector2.new(0,1)track.BorderSizePixel=0 track.Position=UDim2.new(0,10,1,-4)track
.Size=UDim2.new(1,-20,0,4)track.ClipsDescendants=false track.ZIndex=3 track.
Parent=frame window:RegisterThemeObject(track,'BackgroundColor3',
'SliderBackground')local corner_radius=Instance.new('UICorner')corner_radius.
Name=Util.RandomName()corner_radius.CornerRadius=UDim.new(1,0)corner_radius.
Parent=track local border=Instance.new('UIStroke')border.Name=Util.RandomName()
border.Thickness=1 border.Parent=track window:RegisterThemeObject(border,'Color'
,'SliderStroke')local fill=Instance.new('Frame')fill.Name=Util.RandomName()fill.
BorderSizePixel=0 fill.Size=UDim2.new(0,0,1,0)fill.ZIndex=4 fill.Parent=track
window:RegisterThemeObject(fill,'BackgroundColor3','SliderFill')local
corner_radius_2=Instance.new('UICorner')corner_radius_2.Name=Util.RandomName()
corner_radius_2.CornerRadius=UDim.new(1,0)corner_radius_2.Parent=fill local
knob_dot=Instance.new('Frame')knob_dot.Name=Util.RandomName()knob_dot.
AnchorPoint=Vector2.new(0.5,0.5)knob_dot.BackgroundColor3=Color3.new(1,1,1)
knob_dot.BorderSizePixel=0 knob_dot.Position=UDim2.new(0,0,0.5,0)knob_dot.Size=
UDim2.new(0,8,0,8)knob_dot.ZIndex=5 knob_dot.Parent=track local corner_radius_3=
Instance.new('UICorner')corner_radius_3.Name=Util.RandomName()corner_radius_3.
CornerRadius=UDim.new(1,0)corner_radius_3.Parent=knob_dot if desc then local
desc_label=Instance.new('TextLabel')desc_label.Name=Util.RandomName()desc_label.
BackgroundTransparency=1 desc_label.BorderSizePixel=0 desc_label.Position=UDim2.
new(0,10,0,14)desc_label.Size=UDim2.new(1,-14,0,12)desc_label.Text=desc
desc_label.TextSize=10 desc_label.TextTruncate=Enum.TextTruncate.AtEnd
desc_label.TextXAlignment=Enum.TextXAlignment.Left desc_label.Parent=frame
window:RegisterThemeObject(desc_label,'FontFace','FontRegular')window:
RegisterThemeObject(desc_label,'TextColor3','SubText')end local function
ApplyVisual(v)local span=range[2]-range[1]local alpha=span==0 and 0 or((v-range[
1])/span)Util.Tween(fill,kTweenSlow,{Size=UDim2.new(alpha,0,1,0)})Util.Tween(
knob_dot,kTweenSlow,{Position=UDim2.new(alpha,0,0.5,0)})value_label.Text=
tostring(v)..suffix end function control:Set(v)control.CurrentValue=Snap(v)
ApplyVisual(control.CurrentValue)Util.SafeCall(callback,control.CurrentValue)end
local dragging_slider=false local function UpdateFromInput(input)local abs=track
.AbsolutePosition local sz=track.AbsoluteSize local alpha=math.clamp((input.
Position.X-abs.X)/sz.X,0,1)control:Set(range[1]+alpha*(range[2]-range[1]))end
interact.InputBegan:Connect(function(input)if input.UserInputType~=Enum.
UserInputType.MouseButton1 and input.UserInputType~=Enum.UserInputType.Touch
then return end dragging_slider=true UpdateFromInput(input)end)local moved_conn=
UserInputService.InputChanged:Connect(function(input)if not dragging_slider then
return end if input.UserInputType~=Enum.UserInputType.MouseMovement and input.
UserInputType~=Enum.UserInputType.Touch then return end UpdateFromInput(input)
end)local ended_conn=UserInputService.InputEnded:Connect(function(input)if input
.UserInputType~=Enum.UserInputType.MouseButton1 and input.UserInputType~=Enum.
UserInputType.Touch then return end dragging_slider=false end)frame.Destroying:
Connect(function()moved_conn:Disconnect()ended_conn:Disconnect()end)interact.
MouseEnter:Connect(function()Util.Tween(track,kTweenSlow,{BackgroundColor3=
window.theme.SliderHoverBackground})Util.Tween(fill,kTweenSlow,{BackgroundColor3
=window.theme.SliderHoverFill})end)interact.MouseLeave:Connect(function()Util.
Tween(track,kTweenSlow,{BackgroundColor3=window.theme.SliderBackground})Util.
Tween(fill,kTweenSlow,{BackgroundColor3=window.theme.SliderFill})end)
ApplyVisual(control.CurrentValue)return control end function Elements.
CreateDropdown(section,container,data)local name=data.Name or'Dropdown'local
options=data.Options or{}local multi=data.MultipleOptions or false local
allow_none=data.AllowNone or false local callback=data.Callback or function()end
local desc=data.Description local current=data.CurrentOption if multi and type(
current)~='table'then current=current and{current}or{}elseif not multi and type(
current)=='table'then current=current[1]end local closed_height=desc and 40 or
25 local window=section.tab.window local control={Name=name,CurrentOption=
current,Type='Dropdown',section=section}local frame=Instance.new('Frame')frame.
Name=Util.RandomName()frame.BorderSizePixel=0 frame.Size=UDim2.new(1,0,0,
closed_height)frame.LayoutOrder=#container:GetChildren()frame.ClipsDescendants=
false frame.ZIndex=1 frame.Parent=container control.frame=frame window:
RegisterThemeObject(frame,'BackgroundColor3','DropdownBackground')local stroke=
Instance.new('UIStroke')stroke.Name=Util.RandomName()stroke.Thickness=1 stroke.
Parent=frame window:RegisterThemeObject(stroke,'Color','DropdownStroke')local
corner=Instance.new('UICorner')corner.Name=Util.RandomName()corner.CornerRadius=
UDim.new(0,4)corner.Parent=frame local interact=Instance.new('TextButton')
interact.Name=Util.RandomName()interact.BackgroundTransparency=1 interact.
BorderSizePixel=0 interact.Size=UDim2.new(1,0,1,0)interact.Text=''interact.
TextTransparency=1 interact.ZIndex=10 interact.Parent=frame local title_label=
Instance.new('TextLabel')title_label.Name=Util.RandomName()title_label.
BackgroundTransparency=1 title_label.BorderSizePixel=0 title_label.Position=
UDim2.new(0,10,0,0)title_label.Size=UDim2.new(1,-14,1,0)title_label.Text=name
title_label.TextSize=12 title_label.TextTruncate=Enum.TextTruncate.AtEnd
title_label.TextXAlignment=Enum.TextXAlignment.Left title_label.Parent=frame
window:RegisterThemeObject(title_label,'FontFace','FontSemiBold')window:
RegisterThemeObject(title_label,'TextColor3','Text')if desc then local
desc_label=Instance.new('TextLabel')desc_label.Name=Util.RandomName()desc_label.
BackgroundTransparency=1 desc_label.BorderSizePixel=0 desc_label.Position=UDim2.
new(0,10,0,14)desc_label.Size=UDim2.new(1,-14,0,12)desc_label.Text=desc
desc_label.TextSize=10 desc_label.TextTruncate=Enum.TextTruncate.AtEnd
desc_label.TextXAlignment=Enum.TextXAlignment.Left desc_label.Parent=frame
window:RegisterThemeObject(desc_label,'FontFace','FontRegular')window:
RegisterThemeObject(desc_label,'TextColor3','SubText')end local sel_label=
Instance.new('TextLabel')sel_label.Name=Util.RandomName()sel_label.
BackgroundTransparency=1 sel_label.BorderSizePixel=0 sel_label.AnchorPoint=
Vector2.new(1,0.5)sel_label.Position=UDim2.new(1,-22,0.5,0)sel_label.Size=UDim2.
new(0,90,0,14)sel_label.Text='None'sel_label.TextSize=11 sel_label.TextTruncate=
Enum.TextTruncate.AtEnd sel_label.TextXAlignment=Enum.TextXAlignment.Right
sel_label.ZIndex=2 sel_label.Parent=frame window:RegisterThemeObject(sel_label,
'FontFace','FontSemiBold')window:RegisterThemeObject(sel_label,'TextColor3',
'SubText')local chevron=Instance.new('ImageLabel')chevron.Name=Util.RandomName()
chevron.BackgroundTransparency=1 chevron.AnchorPoint=Vector2.new(1,0.5)chevron.
Position=UDim2.new(1,-6,0.5,0)chevron.Size=UDim2.new(0,12,0,12)chevron.ZIndex=2
chevron.Image=Assets.Get(3)chevron.Parent=frame window:RegisterThemeObject(
chevron,'ImageColor3','SubText')local list_frame=Instance.new('ScrollingFrame')
list_frame.Name=Util.RandomName()list_frame.AutomaticCanvasSize=Enum.
AutomaticSize.Y list_frame.ScrollBarThickness=4 list_frame.CanvasSize=UDim2.new(
)list_frame.BorderSizePixel=0 list_frame.AnchorPoint=Vector2.new(0,0)list_frame.
Position=UDim2.new(0,0,0,0)list_frame.Size=UDim2.new(0,0,0,0)list_frame.
ClipsDescendants=true list_frame.ZIndex=20 window:RegisterThemeObject(list_frame
,'BackgroundColor3','DropdownUnselected')task.spawn(function()while not
list_frame.Parent do local layer=GetDropdownLayer()if layer then list_frame.
Parent=layer break end task.wait()end end)local corner_radius=Instance.new(
'UICorner')corner_radius.Name=Util.RandomName()corner_radius.CornerRadius=UDim.
new(0,4)corner_radius.Parent=list_frame local border=Instance.new('UIStroke')
border.Name=Util.RandomName()border.Thickness=1 border.Parent=list_frame window:
RegisterThemeObject(border,'Color','DropdownStroke')local list_layout=Instance.
new('UIListLayout')list_layout.Name=Util.RandomName()list_layout.Padding=UDim.
new(0,0)list_layout.FillDirection=Enum.FillDirection.Vertical list_layout.
SortOrder=Enum.SortOrder.LayoutOrder list_layout.Parent=list_frame local is_open
=false local function IsSelected(opt)if multi then if table.find(control.
CurrentOption,opt)then return true end return false end return control.
CurrentOption==opt end local function SelectedLabel()if not multi then return
control.CurrentOption or'None'end local current_options=control.CurrentOption if
type(current_options)~='table'then return tostring(current_options or'None')end
local valid={}for _,value in ipairs(current_options)do local t=typeof(value)if t
=='string'or t=='number'then valid[#valid+1]=tostring(value)end end return#valid
>0 and table.concat(valid,', ')or'None'end local function RefreshList()for _,
child in ipairs(list_frame:GetChildren())do if child:IsA('Frame')then child:
Destroy()end end for i,opt in ipairs(options)do local row=Instance.new('Frame')
row.Name=Util.RandomName()row.BorderSizePixel=0 row.LayoutOrder=i row.Size=UDim2
.new(1,0,0,22)row.ZIndex=21 row.Parent=list_frame if IsSelected(opt)then window:
RegisterThemeObject(row,'BackgroundColor3','DropdownSelected')else window:
RegisterThemeObject(row,'BackgroundColor3','DropdownUnselected')end local
row_label=Instance.new('TextLabel')row_label.Name=Util.RandomName()row_label.
BackgroundTransparency=1 row_label.Position=UDim2.new(0,8,0,0)row_label.Size=
UDim2.new(1,-10,1,0)row_label.Text=opt row_label.TextSize=11 row_label.
TextTruncate=Enum.TextTruncate.AtEnd row_label.TextXAlignment=Enum.
TextXAlignment.Left row_label.ZIndex=22 row_label.Parent=row window:
RegisterThemeObject(row_label,'FontFace','FontSemiBold')window:
RegisterThemeObject(row_label,'TextColor3','Text')local row_btn=Instance.new(
'TextButton')row_btn.Name=Util.RandomName()row_btn.BackgroundTransparency=1
row_btn.BorderSizePixel=0 row_btn.Size=UDim2.new(1,0,1,0)row_btn.Text=''row_btn.
ZIndex=23 row_btn.Parent=row row_btn.MouseButton1Click:Connect(function()control
:Set(opt)end)row_btn.MouseEnter:Connect(function()Util.Tween(row,kTweenSlow,{
BackgroundColor3=window.theme.DropdownSelected})end)row_btn.MouseLeave:Connect(
function()Util.Tween(row,kTweenSlow,{BackgroundColor3=IsSelected(opt)and window.
theme.DropdownSelected or window.theme.DropdownUnselected})end)end sel_label.
Text=SelectedLabel()end local function UpdateListPosition()local abs_pos=frame.
AbsolutePosition local abs_size=frame.AbsoluteSize local height=88 list_frame.
Size=UDim2.fromOffset(abs_size.X,height)RunService.Heartbeat:Wait()local
list_frame_size=list_frame.AbsoluteSize list_frame.Position=UDim2.fromOffset(
abs_pos.X,abs_pos.Y+list_frame_size.Y)end local upd_conn local function
ToggleOpen()if is_open then control:Close()return end if DropdownManager.Current
and DropdownManager.Current~=control then DropdownManager.Current:Close()end
DropdownManager.Current=control is_open=true RefreshList()UpdateListPosition()if
upd_conn then upd_conn:Disconnect()end upd_conn=RunService.RenderStepped:
Connect(UpdateListPosition)list_frame.Visible=true Util.Tween(chevron,kTweenSlow
,{Rotation=180})end function control:Set(option,loading)if multi then if loading
then control.CurrentOption=table.clone(option)else local idx=table.find(control.
CurrentOption,option)if idx then table.remove(control.CurrentOption,idx)else
table.insert(control.CurrentOption,option)end end else if allow_none and control
.CurrentOption==option then control.CurrentOption=nil else control.CurrentOption
=option end if is_open then ToggleOpen()end end RefreshList()Util.SafeCall(
callback,control.CurrentOption)end function control:Close()if not is_open then
return end is_open=false if upd_conn then upd_conn:Disconnect()upd_conn=nil end
list_frame.Visible=false Util.Tween(chevron,kTweenSlow,{Rotation=0})end function
control:Refresh(new_options,new_current)options=new_options control.
CurrentOption=new_current RefreshList()end interact.MouseButton1Click:Connect(
ToggleOpen)interact.MouseEnter:Connect(function()Util.Tween(frame,kTweenSlow,{
BackgroundColor3=window.theme.DropdownHoverBackground})end)interact.MouseLeave:
Connect(function()Util.Tween(frame,kTweenSlow,{BackgroundColor3=window.theme.
DropdownBackground})end)frame.Destroying:Connect(function()if upd_conn then
upd_conn:Disconnect()end if DropdownManager.Current==control then
DropdownManager.Current=nil end end)RefreshList()return control end function
Elements.CreateInput(section,container,data)local name=data.Name or'Input'local
placeholder=data.PlaceholderText or'Enter text...'local char_limit=data.
CharLimit local numbers=data.NumbersOnly or false local clear=data.
RemoveTextAfterFocusLost or false local value=data.CurrentValue or''local
callback=data.Callback or function()end local changed_cb=data.ChangedCallback
local desc=data.Description local height=desc and 40 or 25 local window=section.
tab.window local control={Name=name,CurrentValue=value,Type='Input',section=
section}local frame=Instance.new('Frame')frame.Name=Util.RandomName()frame.
BackgroundTransparency=1 frame.BorderSizePixel=0 frame.Size=UDim2.new(1,0,0,
height)frame.LayoutOrder=#container:GetChildren()frame.ClipsDescendants=false
frame.Parent=container control.frame=frame local interact=Instance.new(
'TextButton')interact.Name=Util.RandomName()interact.BackgroundTransparency=1
interact.BorderSizePixel=0 interact.Size=UDim2.new(1,0,1,0)interact.Text=''
interact.TextTransparency=1 interact.ZIndex=10 interact.Active=false interact.
Visible=false interact.Parent=frame local title_label=Instance.new('TextLabel')
title_label.Name=Util.RandomName()title_label.BackgroundTransparency=1
title_label.BorderSizePixel=0 title_label.Position=UDim2.new(0,10,0,0)
title_label.Size=UDim2.new(0.5,0,1,0)title_label.Text=name title_label.TextSize=
12 title_label.TextTruncate=Enum.TextTruncate.AtEnd title_label.TextXAlignment=
Enum.TextXAlignment.Left title_label.Parent=frame window:RegisterThemeObject(
title_label,'FontFace','FontSemiBold')window:RegisterThemeObject(title_label,
'TextColor3','Text')local box_bg=Instance.new('Frame')box_bg.Name=Util.
RandomName()box_bg.AnchorPoint=Vector2.new(1,0.5)box_bg.BorderSizePixel=0 box_bg
.Position=UDim2.new(1,-6,0.5,0)box_bg.Size=UDim2.new(0.5,0,0,16)box_bg.ZIndex=2
box_bg.Parent=frame window:RegisterThemeObject(box_bg,'BackgroundColor3',
'InputBackground')local corner_radius=Instance.new('UICorner')corner_radius.Name
=Util.RandomName()corner_radius.CornerRadius=UDim.new(0,3)corner_radius.Parent=
box_bg local border=Instance.new('UIStroke')border.Name=Util.RandomName()border.
Thickness=1 border.Parent=box_bg window:RegisterThemeObject(border,'Color',
'InputStroke')local box=Instance.new('TextBox')box.Name=Util.RandomName()box.
BackgroundTransparency=1 box.BorderSizePixel=0 box.ClearTextOnFocus=false box.
PlaceholderText=placeholder box.Size=UDim2.new(1,-6,1,0)box.Position=UDim2.new(0
,4,0,0)box.Text=value box.TextSize=11 box.TextTruncate=Enum.TextTruncate.AtEnd
box.TextXAlignment=Enum.TextXAlignment.Left box.ZIndex=3 box.Parent=box_bg
window:RegisterThemeObject(box,'FontFace','FontRegular')window:
RegisterThemeObject(box,'PlaceholderColor3','SubText')window:
RegisterThemeObject(box,'TextColor3','Text')if desc then local desc_label=
Instance.new('TextLabel')desc_label.Name=Util.RandomName()desc_label.
BackgroundTransparency=1 desc_label.BorderSizePixel=0 desc_label.Position=UDim2.
new(0,10,0,14)desc_label.Size=UDim2.new(1,-14,0,12)desc_label.Text=desc
desc_label.TextSize=10 desc_label.TextTruncate=Enum.TextTruncate.AtEnd
desc_label.TextXAlignment=Enum.TextXAlignment.Left desc_label.Parent=frame
window:RegisterThemeObject(desc_label,'FontFace','FontRegular')window:
RegisterThemeObject(desc_label,'TextColor3','SubText')end box.Focused:Connect(
function()Util.Tween(border,kTweenSlow,{Color=window.theme.InputStrokeSelected})
end)box.FocusLost:Connect(function()Util.Tween(border,kTweenSlow,{Color=window.
theme.InputStroke})local text=box.Text if numbers then text=string.gsub(text,
'[^%d%.%-]','')end if char_limit then text=string.sub(text,1,char_limit)end
control.CurrentValue=text box.Text=clear and''or text Util.SafeCall(callback,
text)end)if changed_cb then box:GetPropertyChangedSignal('Text'):Connect(
function()Util.SafeCall(changed_cb,box.Text)end)end function control:Set(v)
control.CurrentValue=v box.Text=v end return control end function Elements.
CreateMultiLineInput(section,container,data)local name=data.Name or'Input'local
placeholder=data.PlaceholderText or'Enter text...'local char_limit=data.
CharLimit local value=data.CurrentValue or''local callback=data.Callback or
function()end local changed_cb=data.ChangedCallback local desc=data.Description
local height=desc and 70 or 58 local window=section.tab.window local control={
Name=name,CurrentValue=value,Type='MultiLineInput',section=section}local frame=
Instance.new('Frame')frame.Name=Util.RandomName()frame.BackgroundTransparency=1
frame.BorderSizePixel=0 frame.Size=UDim2.new(1,0,0,height)frame.LayoutOrder=#
container:GetChildren()frame.ClipsDescendants=false frame.Parent=container
control.frame=frame local interact=Instance.new('TextButton')interact.Name=Util.
RandomName()interact.BackgroundTransparency=1 interact.BorderSizePixel=0
interact.Size=UDim2.new(1,0,1,0)interact.Text=''interact.TextTransparency=1
interact.ZIndex=10 interact.Active=false interact.Visible=false interact.Parent=
frame local title_label=Instance.new('TextLabel')title_label.Name=Util.
RandomName()title_label.BackgroundTransparency=1 title_label.Position=UDim2.new(
0,8,0,2)title_label.Size=UDim2.new(1,-12,0,13)title_label.Text=name title_label.
TextSize=12 title_label.TextTruncate=Enum.TextTruncate.AtEnd title_label.
TextXAlignment=Enum.TextXAlignment.Left title_label.Parent=frame window:
RegisterThemeObject(title_label,'FontFace','FontSemiBold')window:
RegisterThemeObject(title_label,'TextColor3','Text')local box_bg=Instance.new(
'Frame')box_bg.Name=Util.RandomName()box_bg.BorderSizePixel=0 box_bg.Position=
UDim2.new(0,6,0,16)box_bg.Size=UDim2.new(1,-12,0,38)box_bg.ZIndex=2 box_bg.
Parent=frame window:RegisterThemeObject(box_bg,'BackgroundColor3',
'InputBackground')local corner_radius=Instance.new('UICorner')corner_radius.Name
=Util.RandomName()corner_radius.CornerRadius=UDim.new(0,3)corner_radius.Parent=
box_bg local border=Instance.new('UIStroke')border.Name=Util.RandomName()border.
Thickness=1 border.Parent=box_bg window:RegisterThemeObject(border,'Color',
'InputStroke')local box=Instance.new('TextBox')box.Name=Util.RandomName()box.
BackgroundTransparency=1 box.BorderSizePixel=0 box.ClearTextOnFocus=false box.
MultiLine=true box.TextWrapped=true box.PlaceholderText=placeholder box.Position
=UDim2.new(0,4,0,2)box.Size=UDim2.new(1,-8,1,-4)box.Text=value box.TextSize=11
box.TextXAlignment=Enum.TextXAlignment.Left box.TextYAlignment=Enum.
TextYAlignment.Top box.ZIndex=3 box.Parent=box_bg window:RegisterThemeObject(box
,'FontFace','FontRegular')window:RegisterThemeObject(box,'PlaceholderColor3',
'SubText')window:RegisterThemeObject(box,'TextColor3','Text')if desc then local
desc_label=Instance.new('TextLabel')desc_label.Name=Util.RandomName()desc_label.
BackgroundTransparency=1 desc_label.BorderSizePixel=0 desc_label.Position=UDim2.
new(0,8,0,height-14)desc_label.Size=UDim2.new(1,-12,0,12)desc_label.Text=desc
desc_label.TextSize=10 desc_label.TextTruncate=Enum.TextTruncate.AtEnd
desc_label.TextXAlignment=Enum.TextXAlignment.Left desc_label.Parent=frame
window:RegisterThemeObject(desc_label,'FontFace','FontRegular')window:
RegisterThemeObject(desc_label,'TextColor3','SubText')end box.Focused:Connect(
function()Util.Tween(border,kTweenSlow,{Color=window.theme.InputStrokeSelected})
end)box.FocusLost:Connect(function()Util.Tween(border,kTweenSlow,{Color=window.
theme.InputStroke})local text=box.Text if char_limit then text=text:sub(1,
char_limit)end control.CurrentValue=text box.Text=text Util.SafeCall(callback,
text)end)if changed_cb then box:GetPropertyChangedSignal('Text'):Connect(
function()Util.SafeCall(changed_cb,box.Text)end)end function control:Set(v)
control.CurrentValue=v box.Text=v end return control end function Elements.
CreateKeybind(section,container,data)local name=data.Name or'Keybind'local
keybind=data.CurrentKeybind or'Not Set'local hold=data.HoldToInteract or false
local callback=data.Callback or function()end local desc=data.Description local
height=desc and 40 or 25 local window=section.tab.window local control={Name=
name,CurrentKeybind=keybind,Type='Keybind',Hold=hold,Pressed=false,
OnPressedChanged=function()end,section=section}local frame=Instance.new('Frame')
frame.Name=Util.RandomName()frame.BackgroundTransparency=1 frame.BorderSizePixel
=0 frame.Size=UDim2.new(1,0,0,height)frame.LayoutOrder=#container:GetChildren()
frame.ClipsDescendants=false frame.Parent=container control.frame=frame local
padding=Instance.new('UIPadding')padding.Name=Util.RandomName()padding.
PaddingTop=UDim.new(0,0)padding.PaddingBottom=UDim.new(0,0)padding.PaddingLeft=
UDim.new(0,10)padding.PaddingRight=UDim.new(0,10)padding.Parent=frame local
list_layout=Instance.new('UIListLayout')list_layout.Name=Util.RandomName()
list_layout.Padding=UDim.new(0,4)list_layout.FillDirection=Enum.FillDirection.
Horizontal list_layout.SortOrder=Enum.SortOrder.LayoutOrder list_layout.Parent=
frame local title_label=Instance.new('TextLabel')title_label.Name=Util.
RandomName()title_label.BackgroundTransparency=1 title_label.BorderSizePixel=0
title_label.Size=UDim2.new(0,0,1,0)title_label.LayoutOrder=1 title_label.Text=
name title_label.TextSize=12 title_label.TextTruncate=Enum.TextTruncate.AtEnd
title_label.TextXAlignment=Enum.TextXAlignment.Left title_label.Parent=frame
window:RegisterThemeObject(title_label,'FontFace','FontSemiBold')window:
RegisterThemeObject(title_label,'TextColor3','Text')local flex_item=Instance.
new('UIFlexItem')flex_item.Name=Util.RandomName()flex_item.FlexMode=Enum.
UIFlexMode.Fill flex_item.Parent=title_label local key_btn=Instance.new(
'TextButton')key_btn.Name=Util.RandomName()key_btn.AnchorPoint=Vector2.new(0,0.5
)key_btn.AutoButtonColor=false key_btn.BorderSizePixel=0 key_btn.AutomaticSize=
Enum.AutomaticSize.X key_btn.Size=UDim2.new(0,0,0,16)key_btn.TextXAlignment=Enum
.TextXAlignment.Center key_btn.LayoutOrder=2 key_btn.Text='['..keybind..']'
key_btn.TextSize=11 key_btn.ZIndex=3 key_btn.Parent=frame window:
RegisterThemeObject(key_btn,'FontFace','FontSemiBold')window:
RegisterThemeObject(key_btn,'BackgroundColor3','KeybindBackground')window:
RegisterThemeObject(key_btn,'TextColor3','SubText')local corner_radius=Instance.
new('UICorner')corner_radius.Name=Util.RandomName()corner_radius.CornerRadius=
UDim.new(0,3)corner_radius.Parent=key_btn local border=Instance.new('UIStroke')
border.Name=Util.RandomName()border.ApplyStrokeMode=Enum.ApplyStrokeMode.Border
border.Thickness=1 border.Parent=key_btn window:RegisterThemeObject(border,
'Color','KeybindStroke')local mode_btn=Instance.new('TextButton')mode_btn.Name=
Util.RandomName()mode_btn.AnchorPoint=Vector2.new(0,0.5)mode_btn.AutoButtonColor
=false mode_btn.BorderSizePixel=0 mode_btn.AutomaticSize=Enum.AutomaticSize.X
mode_btn.Size=UDim2.new(0,0,0,16)mode_btn.TextXAlignment=Enum.TextXAlignment.
Center mode_btn.LayoutOrder=3 mode_btn.Text=control.Hold and'Hold'or'Toggle'
mode_btn.TextSize=11 mode_btn.ZIndex=3 mode_btn.Parent=frame window:
RegisterThemeObject(mode_btn,'FontFace','FontSemiBold')window:
RegisterThemeObject(mode_btn,'BackgroundColor3','KeybindBackground')window:
RegisterThemeObject(mode_btn,'TextColor3','SubText')local corner_radius_2=
Instance.new('UICorner')corner_radius_2.Name=Util.RandomName()corner_radius_2.
CornerRadius=UDim.new(0,3)corner_radius_2.Parent=mode_btn local border_2=
Instance.new('UIStroke')border_2.Name=Util.RandomName()border_2.ApplyStrokeMode=
Enum.ApplyStrokeMode.Border border_2.Thickness=1 border_2.Parent=mode_btn window
:RegisterThemeObject(border_2,'Color','KeybindStroke')if desc then local
desc_label=Instance.new('TextLabel')desc_label.Name=Util.RandomName()desc_label.
BackgroundTransparency=1 desc_label.BorderSizePixel=0 desc_label.Position=UDim2.
new(0,10,0,14)desc_label.Size=UDim2.new(1,-14,0,12)desc_label.Text=desc
desc_label.TextSize=10 desc_label.TextTruncate=Enum.TextTruncate.AtEnd
desc_label.TextXAlignment=Enum.TextXAlignment.Left desc_label.Parent=frame
window:RegisterThemeObject(desc_label,'FontFace','FontRegular')window:
RegisterThemeObject(desc_label,'TextColor3','SubText')end local listening=false
local listen_conn local function UpdateLabel()key_btn.Text='['..control.
CurrentKeybind..']'mode_btn.Text=control.Hold and'Hold'or'Toggle'end
local function GetInputName(input)if input.UserInputType==Enum.UserInputType.
MouseButton1 then return'MB1'elseif input.UserInputType==Enum.UserInputType.
MouseButton2 then return'MB2'elseif input.UserInputType==Enum.UserInputType.
MouseButton3 then return'MB3'elseif input.KeyCode~=Enum.KeyCode.Unknown then
return input.KeyCode.Name end return nil end function control:Set(key_name)
control.CurrentKeybind=key_name UpdateLabel()end function control:SetMode(mode)
control.Hold=(mode=='Hold')and true or false UpdateLabel()end function control:
SetPressed(value)if self.Pressed==value then return end self.Pressed=value if
self.OnPressedChanged then Util.SafeCall(self.OnPressedChanged,value)end end
key_btn.MouseButton1Click:Connect(function()if listening then return end
listening=true key_btn.Text='[...]'Util.Tween(border,kTweenSlow,{Color=window.
theme.KeybindStrokeSelected})listen_conn=UserInputService.InputBegan:Connect(
function(input,_)if input.KeyCode==Enum.KeyCode.Backspace then listen_conn:
Disconnect()listen_conn=nil listening=false Util.Tween(border,kTweenSlow,{Color=
window.theme.KeybindStroke})control:Set('Not Set')return end local key_name=
GetInputName(input)if not key_name then return end listen_conn:Disconnect()
listen_conn=nil listening=false Util.Tween(border,kTweenSlow,{Color=window.theme
.KeybindStroke})control:Set(key_name)end)end)mode_btn.MouseButton1Click:Connect(
function()if listening then return end control.Hold=not control.Hold control:
SetMode(control.Hold and'Hold'or'Toggle')end)local global_began=UserInputService
.InputBegan:Connect(function(input,processed)if processed or listening then
return end local key_name=GetInputName(input)if not key_name or key_name~=
control.CurrentKeybind then return end if control.Hold then if control.Pressed
then return end control:SetPressed(true)Util.SafeCall(callback,true)else control
:SetPressed(not control.Pressed)Util.SafeCall(callback,control.Pressed)end end)
local global_ended=UserInputService.InputEnded:Connect(function(input)if
listening then return end local key_name=GetInputName(input)if not key_name or
key_name~=control.CurrentKeybind then return end if control.Hold and control.
Pressed then control:SetPressed(false)Util.SafeCall(callback,false)end end)frame
.Destroying:Connect(function()global_began:Disconnect()global_ended:Disconnect()
if listen_conn then listen_conn:Disconnect()end end)UpdateLabel()return control
end function Elements.CreateColorPicker(section,container,data)local name=data.
Name or'Color'local color=data.Color or Color3.new(1,1,1)local callback=data.
Callback or function()end local desc=data.Description local closed_height=desc
and 40 or 25 local panel_height=90 local window=section.tab.window local control
={Name=name,Color=color,Type='ColorPicker',section=section}local frame=Instance.
new('Frame')frame.Name=Util.RandomName()frame.BorderSizePixel=0 frame.Size=UDim2
.new(1,0,0,closed_height)frame.LayoutOrder=#container:GetChildren()frame.
ClipsDescendants=false frame.ZIndex=2 frame.Parent=container control.frame=frame
window:RegisterThemeObject(frame,'BackgroundColor3','ColorPickerBackground')
local stroke=Instance.new('UIStroke')stroke.Name=Util.RandomName()stroke.
Thickness=1 stroke.Parent=frame window:RegisterThemeObject(stroke,'Color',
'ColorPickerStroke')local corner=Instance.new('UICorner')corner.Name=Util.
RandomName()corner.CornerRadius=UDim.new(0,4)corner.Parent=frame local interact=
Instance.new('TextButton')interact.Name=Util.RandomName()interact.
BackgroundTransparency=1 interact.BorderSizePixel=0 interact.Size=UDim2.new(1,0,
1,0)interact.Text=''interact.TextTransparency=1 interact.ZIndex=10 interact.
Parent=frame local title_label=Instance.new('TextLabel')title_label.Name=Util.
RandomName()title_label.BackgroundTransparency=1 title_label.BorderSizePixel=0
title_label.Position=UDim2.new(0,10,0,0)title_label.Size=UDim2.new(1,-14,1,0)
title_label.Text=name title_label.TextSize=12 title_label.TextTruncate=Enum.
TextTruncate.AtEnd title_label.TextXAlignment=Enum.TextXAlignment.Left
title_label.Parent=frame window:RegisterThemeObject(title_label,'FontFace',
'FontSemiBold')window:RegisterThemeObject(title_label,'TextColor3','Text')local
swatch=Instance.new('TextButton')swatch.Name=Util.RandomName()swatch.AnchorPoint
=Vector2.new(1,0.5)swatch.AutoButtonColor=false swatch.BackgroundColor3=color
swatch.BorderSizePixel=0 swatch.Position=UDim2.new(1,-8,0.5,0)swatch.Size=UDim2.
new(0,30,0,14)swatch.Text=''swatch.ZIndex=3 swatch.Parent=frame local
corner_radius=Instance.new('UICorner')corner_radius.Name=Util.RandomName()
corner_radius.CornerRadius=UDim.new(0,3)corner_radius.Parent=swatch local border
=Instance.new('UIStroke')border.Name=Util.RandomName()border.ApplyStrokeMode=
Enum.ApplyStrokeMode.Border border.Thickness=1 border.Parent=swatch window:
RegisterThemeObject(border,'Color','InputStroke')if desc then local desc_label=
Instance.new('TextLabel')desc_label.Name=Util.RandomName()desc_label.
BackgroundTransparency=1 desc_label.BorderSizePixel=0 desc_label.Position=UDim2.
new(0,10,0,14)desc_label.Size=UDim2.new(1,-14,0,12)desc_label.Text=desc
desc_label.TextSize=10 desc_label.TextTruncate=Enum.TextTruncate.AtEnd
desc_label.TextXAlignment=Enum.TextXAlignment.Left desc_label.Parent=frame
window:RegisterThemeObject(desc_label,'FontFace','FontRegular')window:
RegisterThemeObject(desc_label,'TextColor3','SubText')end local panel=Instance.
new('Frame')panel.Name=Util.RandomName()panel.BorderSizePixel=0 panel.
AnchorPoint=Vector2.new(0,0)panel.Position=UDim2.fromOffset(0,0)panel.Size=UDim2
.fromOffset(0,0)panel.ClipsDescendants=true panel.ZIndex=9998 panel.Visible=
false window:RegisterThemeObject(panel,'BackgroundColor3','ColorPickerPanel')
local layer=GetColorPickerLayer()if layer then panel.Parent=layer end local
corner_radius_2=Instance.new('UICorner')corner_radius_2.Name=Util.RandomName()
corner_radius_2.CornerRadius=UDim.new(0,4)corner_radius_2.Parent=panel local
border_2=Instance.new('UIStroke')border_2.Name=Util.RandomName()border_2.
Thickness=1 border_2.Parent=panel window:RegisterThemeObject(border_2,'Color',
'ColorPickerStroke')local canvas=Instance.new('Frame')canvas.Name=Util.
RandomName()canvas.BackgroundColor3=Color3.new(1,0,0)canvas.BorderSizePixel=0
canvas.Position=UDim2.new(0,4,0,4)canvas.Size=UDim2.new(1,-70,0,62)canvas.ZIndex
=21 canvas.Parent=panel local corner_radius_3=Instance.new('UICorner')
corner_radius_3.Name=Util.RandomName()corner_radius_3.CornerRadius=UDim.new(0,3)
corner_radius_3.Parent=canvas local light_overlay=Instance.new('Frame')
light_overlay.Name=Util.RandomName()light_overlay.BackgroundColor3=Color3.new(1,
1,1)light_overlay.BackgroundTransparency=0 light_overlay.BorderSizePixel=0
light_overlay.Size=UDim2.new(1,0,1,0)light_overlay.ZIndex=22 light_overlay.
Parent=canvas local corner_radius_4=Instance.new('UICorner')corner_radius_4.Name
=Util.RandomName()corner_radius_4.CornerRadius=UDim.new(0,3)corner_radius_4.
Parent=light_overlay local light_gradient=Instance.new('UIGradient')
light_gradient.Name=Util.RandomName()light_gradient.Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),ColorSequenceKeypoint.new(1,
Color3.new(1,1,1))})light_gradient.Transparency=NumberSequence.new({
NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)})light_gradient.
Rotation=0 light_gradient.Parent=light_overlay local dark_overlay=Instance.new(
'Frame')dark_overlay.Name=Util.RandomName()dark_overlay.BackgroundColor3=Color3.
new(0,0,0)dark_overlay.BackgroundTransparency=0 dark_overlay.BorderSizePixel=0
dark_overlay.Size=UDim2.new(1,0,1,0)dark_overlay.ZIndex=22 dark_overlay.Parent=
canvas local corner_radius_5=Instance.new('UICorner')corner_radius_5.Name=Util.
RandomName()corner_radius_5.CornerRadius=UDim.new(0,3)corner_radius_5.Parent=
dark_overlay local dark_gradient=Instance.new('UIGradient')dark_gradient.Name=
Util.RandomName()dark_gradient.Color=ColorSequence.new({ColorSequenceKeypoint.
new(0,Color3.new(0,0,0)),ColorSequenceKeypoint.new(1,Color3.new(0,0,0))})
dark_gradient.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1)})dark_gradient.Rotation=-90 dark_gradient.Parent
=dark_overlay local cursor=Instance.new('Frame')cursor.Name=Util.RandomName()
cursor.AnchorPoint=Vector2.new(0.5,0.5)cursor.BackgroundColor3=Color3.new(1,1,1)
cursor.BorderSizePixel=0 cursor.Position=UDim2.new(1,0,0,0)cursor.Size=UDim2.
new(0,6,0,6)cursor.ZIndex=25 cursor.Parent=canvas local corner_radius_6=Instance
.new('UICorner')corner_radius_6.Name=Util.RandomName()corner_radius_6.
CornerRadius=UDim.new(1,0)corner_radius_6.Parent=cursor local hue_bar=Instance.
new('Frame')hue_bar.Name=Util.RandomName()hue_bar.BorderSizePixel=0 hue_bar.
Position=UDim2.new(1,-58,0,4)hue_bar.Size=UDim2.new(0,12,0,62)hue_bar.ZIndex=21
hue_bar.Parent=panel local corner_radius_7=Instance.new('UICorner')
corner_radius_7.Name=Util.RandomName()corner_radius_7.CornerRadius=UDim.new(0,3)
corner_radius_7.Parent=hue_bar local hue_gradient=Instance.new('UIGradient')
hue_gradient.Name=Util.RandomName()hue_gradient.Color=ColorSequence.new({
ColorSequenceKeypoint.new(0,Color3.fromHSV(0,1,1)),ColorSequenceKeypoint.new(
0.17,Color3.fromHSV(0.17,1,1)),ColorSequenceKeypoint.new(0.33,Color3.fromHSV(
0.33,1,1)),ColorSequenceKeypoint.new(0.5,Color3.fromHSV(0.5,1,1)),
ColorSequenceKeypoint.new(0.67,Color3.fromHSV(0.67,1,1)),ColorSequenceKeypoint.
new(0.83,Color3.fromHSV(0.83,1,1)),ColorSequenceKeypoint.new(1,Color3.fromHSV(1,
1,1))})hue_gradient.Rotation=90 hue_gradient.Parent=hue_bar local hue_knob=
Instance.new('Frame')hue_knob.Name=Util.RandomName()hue_knob.AnchorPoint=Vector2
.new(0.5,0.5)hue_knob.BackgroundColor3=Color3.new(1,1,1)hue_knob.BorderSizePixel
=0 hue_knob.Position=UDim2.new(0.5,0,0,0)hue_knob.Size=UDim2.new(1,2,0,4)
hue_knob.ZIndex=22 hue_knob.Parent=hue_bar local corner_radius_8=Instance.new(
'UICorner')corner_radius_8.Name=Util.RandomName()corner_radius_8.CornerRadius=
UDim.new(0,2)corner_radius_8.Parent=hue_knob local hex_bg=Instance.new('Frame')
hex_bg.Name=Util.RandomName()hex_bg.BorderSizePixel=0 hex_bg.Position=UDim2.new(
1,-44,0,70)hex_bg.Size=UDim2.new(0,40,0,14)hex_bg.ZIndex=21 hex_bg.Parent=panel
window:RegisterThemeObject(hex_bg,'BackgroundColor3','ColorPickerBackground')
local corner_radius_9=Instance.new('UICorner')corner_radius_9.Name=Util.
RandomName()corner_radius_9.CornerRadius=UDim.new(0,3)corner_radius_9.Parent=
hex_bg local border_3=Instance.new('UIStroke')border_3.Name=Util.RandomName()
border_3.Thickness=1 border_3.Parent=hex_bg window:RegisterThemeObject(border_3,
'Color','ColorPickerStroke')local hex_box=Instance.new('TextBox')hex_box.Name=
Util.RandomName()hex_box.BackgroundTransparency=1 hex_box.ClearTextOnFocus=false
hex_box.PlaceholderText='FFFFFF'hex_box.Size=UDim2.new(1,-4,1,0)hex_box.Position
=UDim2.new(0,2,0,0)hex_box.Text=''hex_box.TextSize=9 hex_box.ZIndex=22 hex_box.
Parent=hex_bg window:RegisterThemeObject(hex_box,'FontFace','FontRegular')window
:RegisterThemeObject(hex_box,'PlaceholderColor3','SubText')window:
RegisterThemeObject(hex_box,'TextColor3','Text')local is_open=false local
hue_val,sat_val,val_val=Color3.toHSV(color)local dragging_canvas=false local
dragging_hue=false local upd_conn_cp local function RebuildColor()local c=Color3
.fromHSV(hue_val,sat_val,val_val)canvas.BackgroundColor3=Color3.fromHSV(hue_val,
1,1)return c end local function ApplyVisual(c)swatch.BackgroundColor3=c local h,
s,v=Color3.toHSV(c)hue_val,sat_val,val_val=h,s,v cursor.Position=UDim2.new(s,0,1
-v,0)hue_knob.Position=UDim2.new(0.5,0,h,0)canvas.BackgroundColor3=Color3.
fromHSV(h,1,1)hex_box.Text=string.format('%02X%02X%02X',math.round(c.R*255),math
.round(c.G*255),math.round(c.B*255))end function control:Set(c)control.Color=c
ApplyVisual(c)Util.SafeCall(callback,c)end local function UpdatePanelPosition()
local abs_pos=frame.AbsolutePosition local abs_size=frame.AbsoluteSize local
height=is_open and panel_height or 0 panel.Size=UDim2.fromOffset(abs_size.X,
height)RunService.Heartbeat:Wait()local panelSize=panel.AbsoluteSize panel.
Position=UDim2.fromOffset(abs_pos.X,abs_pos.Y+panelSize.Y)end local function
ToggleOpen()is_open=not is_open if is_open then UpdatePanelPosition()panel.
Visible=true if upd_conn_cp then upd_conn_cp:Disconnect()end upd_conn_cp=
RunService.RenderStepped:Connect(UpdatePanelPosition)else if upd_conn_cp then
upd_conn_cp:Disconnect()upd_conn_cp=nil end panel.Visible=false end Util.Tween(
panel,kTweenSlow,{Size=UDim2.fromOffset(frame.AbsoluteSize.X,is_open and
panel_height or 0)})end interact.MouseButton1Click:Connect(ToggleOpen)interact.
MouseEnter:Connect(function()Util.Tween(frame,kTweenSlow,{BackgroundColor3=
window.theme.ColorPickerHoverBackground})end)interact.MouseLeave:Connect(
function()Util.Tween(frame,kTweenSlow,{BackgroundColor3=window.theme.
ColorPickerBackground})end)canvas.InputBegan:Connect(function(input)if input.
UserInputType~=Enum.UserInputType.MouseButton1 then return end dragging_canvas=
true local abs=canvas.AbsolutePosition local sz=canvas.AbsoluteSize sat_val=math
.clamp((input.Position.X-abs.X)/sz.X,0,1)val_val=1-math.clamp((input.Position.Y-
abs.Y)/sz.Y,0,1)local c=RebuildColor()control:Set(c)end)local canvas_move=
UserInputService.InputChanged:Connect(function(input)if not dragging_canvas then
return end if input.UserInputType~=Enum.UserInputType.MouseMovement then return
end local abs=canvas.AbsolutePosition local sz=canvas.AbsoluteSize sat_val=math.
clamp((input.Position.X-abs.X)/sz.X,0,1)val_val=1-math.clamp((input.Position.Y-
abs.Y)/sz.Y,0,1)control:Set(RebuildColor())end)hue_bar.InputBegan:Connect(
function(input)if input.UserInputType~=Enum.UserInputType.MouseButton1 then
return end dragging_hue=true local abs=hue_bar.AbsolutePosition local sz=hue_bar
.AbsoluteSize hue_val=math.clamp((input.Position.Y-abs.Y)/sz.Y,0,1)control:Set(
RebuildColor())end)local hue_move=UserInputService.InputChanged:Connect(function
(input)if not dragging_hue then return end if input.UserInputType~=Enum.
UserInputType.MouseMovement then return end local abs=hue_bar.AbsolutePosition
local sz=hue_bar.AbsoluteSize hue_val=math.clamp((input.Position.Y-abs.Y)/sz.Y,0
,1)control:Set(RebuildColor())end)local drag_ended=UserInputService.InputEnded:
Connect(function(input)if input.UserInputType~=Enum.UserInputType.MouseButton1
then return end dragging_canvas=false dragging_hue=false end)hex_box.FocusLost:
Connect(function()local txt=hex_box.Text:gsub('[^%x]',''):sub(1,6)if#txt~=6 then
return end local r=tonumber(string.sub(txt,1,2),16)or 255 local g=tonumber(
string.sub(txt,3,4),16)or 255 local b=tonumber(string.sub(txt,5,6),16)or 255
control:Set(Color3.fromRGB(r,g,b))end)frame.Destroying:Connect(function()
canvas_move:Disconnect()hue_move:Disconnect()drag_ended:Disconnect()if
upd_conn_cp then upd_conn_cp:Disconnect()upd_conn_cp=nil end if panel and panel.
Parent then panel:Destroy()end end)ApplyVisual(color)return control end function
Elements.CreateLabel(section,container,data)local title=data.Title or'Label'
local desc=data.Description local height=desc and 40 or 25 local window=section.
tab.window local style=data.Type local control={Name=title,Type='Label',section=
section}local frame=Instance.new('Frame')frame.Name=Util.RandomName()frame.
BackgroundTransparency=1 frame.BorderSizePixel=0 frame.Size=UDim2.new(1,0,0,
height)frame.LayoutOrder=#container:GetChildren()frame.ClipsDescendants=true
frame.ZIndex=1 frame.Parent=container control.frame=frame local title_label=
Instance.new('TextLabel')title_label.Name=Util.RandomName()title_label.
BackgroundTransparency=1 title_label.BorderSizePixel=0 title_label.Position=
UDim2.new(0,8,0,0)title_label.Size=UDim2.new(1,-12,0,25)title_label.Text=title
title_label.TextSize=12 title_label.TextTruncate=Enum.TextTruncate.AtEnd
title_label.TextXAlignment=Enum.TextXAlignment.Left title_label.Parent=frame
window:RegisterThemeObject(title_label,'FontFace','FontSemiBold')if style==
'Success'then window:RegisterThemeObject(title_label,'TextColor3','SuccessColor'
)elseif style=='Warning'then window:RegisterThemeObject(title_label,'TextColor3'
,'WarningColor')elseif style=='Error'then window:RegisterThemeObject(title_label
,'TextColor3','DangerColor')else window:RegisterThemeObject(title_label,
'TextColor3','Text')end local desc_label if desc then desc_label=Instance.new(
'TextLabel')desc_label.Name=Util.RandomName()desc_label.BackgroundTransparency=1
desc_label.Position=UDim2.new(0,8,0,14)desc_label.Size=UDim2.new(1,-12,0,12)
desc_label.Text=desc desc_label.TextSize=10 desc_label.TextTruncate=Enum.
TextTruncate.AtEnd desc_label.TextXAlignment=Enum.TextXAlignment.Left desc_label
.Parent=frame window:RegisterThemeObject(desc_label,'FontFace','FontRegular')
window:RegisterThemeObject(desc_label,'TextColor3','SubText')end function
control:Set(new_title,new_desc)title_label.Text=new_title if new_desc and
desc_label then desc_label.Text=new_desc end end return control end function
Elements.CreateParagraph(section,container,data)local title=data.Title or''local
content=data.Content or''local window=section.tab.window local style=data.Type
local control={Name=title,Type='Paragraph',section=section}local frame=Instance.
new('Frame')frame.Name=Util.RandomName()frame.AutomaticSize=Enum.AutomaticSize.Y
frame.BackgroundTransparency=1 frame.BorderSizePixel=0 frame.Size=UDim2.new(1,0,
0,0)frame.LayoutOrder=#container:GetChildren()frame.ClipsDescendants=true frame.
ZIndex=1 frame.Parent=container control.frame=frame local padding=Instance.new(
'UIPadding')padding.Name=Util.RandomName()padding.PaddingTop=UDim.new(0,4)
padding.PaddingBottom=UDim.new(0,4)padding.PaddingLeft=UDim.new(0,8)padding.
PaddingRight=UDim.new(0,8)padding.Parent=frame local list_layout=Instance.new(
'UIListLayout')list_layout.Name=Util.RandomName()list_layout.Padding=UDim.new(0,
2)list_layout.FillDirection=Enum.FillDirection.Vertical list_layout.SortOrder=
Enum.SortOrder.LayoutOrder list_layout.Parent=frame local title_label=Instance.
new('TextLabel')title_label.Name=Util.RandomName()title_label.AutomaticSize=Enum
.AutomaticSize.Y title_label.BackgroundTransparency=1 title_label.LayoutOrder=0
title_label.Size=UDim2.new(1,0,0,0)title_label.Text=title title_label.TextSize=
12 title_label.TextTruncate=Enum.TextTruncate.AtEnd title_label.TextXAlignment=
Enum.TextXAlignment.Left title_label.Parent=frame window:RegisterThemeObject(
title_label,'FontFace','FontSemiBold')if style=='Success'then window:
RegisterThemeObject(title_label,'TextColor3','SuccessColor')elseif style==
'Warning'then window:RegisterThemeObject(title_label,'TextColor3','WarningColor'
)elseif style=='Error'then window:RegisterThemeObject(title_label,'TextColor3',
'DangerColor')else window:RegisterThemeObject(title_label,'TextColor3','Text')
end local body_label=Instance.new('TextLabel')body_label.Name=Util.RandomName()
body_label.AutomaticSize=Enum.AutomaticSize.Y body_label.BackgroundTransparency=
1 body_label.LayoutOrder=1 body_label.Size=UDim2.new(1,0,0,0)body_label.Text=
content body_label.TextSize=11 body_label.TextWrapped=true body_label.
TextXAlignment=Enum.TextXAlignment.Left body_label.TextYAlignment=Enum.
TextYAlignment.Top body_label.Parent=frame window:RegisterThemeObject(body_label
,'FontFace','FontRegular')window:RegisterThemeObject(body_label,'TextColor3',
'SubText')function control:Set(new_title,new_content)title_label.Text=new_title
body_label.Text=new_content end return control end function Elements.
CreateSearchBox(section,container,data)local placeholder=data.PlaceholderText or
'Search...'local callback=data.Callback or function()end local window=section.
tab.window local control={Name=Util.RandomName(),CurrentValue='',Type=
'SearchBox',section=section}local frame=Instance.new('Frame')frame.Name=Util.
RandomName()frame.BorderSizePixel=0 frame.Size=UDim2.new(1,0,0,25)frame.
LayoutOrder=#container:GetChildren()frame.ClipsDescendants=true frame.ZIndex=1
frame.Parent=container control.frame=frame window:RegisterThemeObject(frame,
'BackgroundColor3','InputBackground')local corner_radius=Instance.new('UICorner'
)corner_radius.Name=Util.RandomName()corner_radius.CornerRadius=UDim.new(0,4)
corner_radius.Parent=frame local border=Instance.new('UIStroke')border.Name=Util
.RandomName()border.Thickness=1 border.Parent=frame window:RegisterThemeObject(
border,'Color','InputStroke')local icon=Instance.new('ImageLabel')icon.Name=Util
.RandomName()icon.BackgroundTransparency=1 icon.Position=UDim2.new(0,6,0.5,-7)
icon.Size=UDim2.new(0,14,0,14)icon.Image=Assets.Get(4)icon.Parent=frame local
box=Instance.new('TextBox')box.Name=Util.RandomName()box.BackgroundTransparency=
1 box.BorderSizePixel=0 box.ClearTextOnFocus=false box.PlaceholderText=
placeholder box.Position=UDim2.new(0,24,0,0)box.Size=UDim2.new(1,-48,1,0)box.
Text=''box.TextSize=12 box.TextXAlignment=Enum.TextXAlignment.Left box.Parent=
frame window:RegisterThemeObject(box,'FontFace','FontRegular')window:
RegisterThemeObject(box,'PlaceholderColor3','SubText')window:
RegisterThemeObject(box,'TextColor3','Text')local clear_btn=Instance.new(
'ImageButton')clear_btn.Name=Util.RandomName()clear_btn.AnchorPoint=Vector2.new(
1,0.5)clear_btn.AutoButtonColor=false clear_btn.BackgroundTransparency=1
clear_btn.Position=UDim2.new(1,-4,0.5,0)clear_btn.Size=UDim2.new(0,18,0,18)
clear_btn.Image=Assets.Get(5)clear_btn.Parent=frame window:RegisterThemeObject(
clear_btn,'ImageColor3','SubText')box.Focused:Connect(function()Util.Tween(
border,kTweenSlow,{Color=window.theme.InputStrokeSelected})end)box.FocusLost:
Connect(function()Util.Tween(border,kTweenSlow,{Color=window.theme.InputStroke})
end)box:GetPropertyChangedSignal('Text'):Connect(function()Util.SafeCall(
callback,box.Text)end)clear_btn.MouseButton1Click:Connect(function()box.Text=''
Util.SafeCall(callback,'')end)function control:Set(v)control.CurrentValue=v box.
Text=v end return control end function Elements.CreateImage(section,container,
data)local asset_id=data.Image local size=data.Size or UDim2.new(1,0,0,80)local
desc=data.Description local window=section.tab.window local control={Name=Util.
RandomName(),Type='Image',section=section}local frame=Instance.new('Frame')frame
.Name=Util.RandomName()frame.BackgroundTransparency=1 frame.BorderSizePixel=0
frame.Size=size frame.Parent=container control.frame=frame local image=Instance.
new('ImageLabel')image.Name=Util.RandomName()image.BackgroundTransparency=1
image.BorderSizePixel=0 image.Image=Assets.Get(asset_id)image.ScaleType=data.
ScaleType or Enum.ScaleType.Fit image.Size=desc and UDim2.new(1,0,1,-14)or UDim2
.new(1,0,1,0)image.Parent=frame if desc then local desc_label=Instance.new(
'TextLabel')desc_label.Name=Util.RandomName()desc_label.AnchorPoint=Vector2.new(
0,1)desc_label.BackgroundTransparency=1 desc_label.Position=UDim2.new(0,0,1,0)
desc_label.Size=UDim2.new(1,0,0,14)desc_label.Text=desc desc_label.TextSize=10
desc_label.TextTruncate=Enum.TextTruncate.AtEnd desc_label.TextXAlignment=Enum.
TextXAlignment.Left desc_label.Parent=frame window:RegisterThemeObject(
desc_label,'FontFace','FontRegular')window:RegisterThemeObject(desc_label,
'TextColor3','SubText')end function control:Set(new_id)image.Image=Assets.Get(
new_id)end return control end function Elements.CreateProgressBar(section,
container,data)local name=data.Name or'Progress'local initial=math.clamp(data.
Initial or 0,0,1)local window=section.tab.window local control={Name=name,Value=
initial,Type='ProgressBar',section=section}local frame=Instance.new('Frame')
frame.Name=Util.RandomName()frame.BackgroundTransparency=1 frame.BorderSizePixel
=0 frame.Size=UDim2.new(1,0,0,25)frame.LayoutOrder=#container:GetChildren()frame
.ClipsDescendants=false frame.ZIndex=2 frame.Parent=container control.frame=
frame local interact=Instance.new('TextButton')interact.Name=Util.RandomName()
interact.BackgroundTransparency=1 interact.BorderSizePixel=0 interact.Size=UDim2
.new(1,0,1,0)interact.Text=''interact.TextTransparency=1 interact.ZIndex=10
interact.Parent=frame local title_label=Instance.new('TextLabel')title_label.
Name=Util.RandomName()title_label.BackgroundTransparency=1 title_label.
BorderSizePixel=0 title_label.Position=UDim2.new(0,10,0,0)title_label.Size=UDim2
.new(1,-14,0,14)title_label.Text=name title_label.TextSize=11 title_label.
TextTruncate=Enum.TextTruncate.AtEnd title_label.TextXAlignment=Enum.
TextXAlignment.Left title_label.Parent=frame window:RegisterThemeObject(
title_label,'FontFace','FontSemiBold')window:RegisterThemeObject(title_label,
'TextColor3','Text')local percent_label=Instance.new('TextLabel')percent_label.
Name=Util.RandomName()percent_label.BackgroundTransparency=1 percent_label.
AnchorPoint=Vector2.new(1,0.5)percent_label.Position=UDim2.new(1,-8,0.5,0)
percent_label.Size=UDim2.new(0,30,0,14)percent_label.Text='0%'percent_label.
TextSize=11 percent_label.TextXAlignment=Enum.TextXAlignment.Right percent_label
.ZIndex=2 percent_label.Parent=frame window:RegisterThemeObject(percent_label,
'FontFace','FontSemiBold')window:RegisterThemeObject(percent_label,'TextColor3',
'SubText')local track=Instance.new('Frame')track.Name=Util.RandomName()track.
AnchorPoint=Vector2.new(0,1)track.BorderSizePixel=0 track.Position=UDim2.new(0,
10,1,-4)track.Size=UDim2.new(1,-50,0,4)track.Parent=frame window:
RegisterThemeObject(track,'BackgroundColor3','SliderBackground')local
corner_radius=Instance.new('UICorner')corner_radius.Name=Util.RandomName()
corner_radius.CornerRadius=UDim.new(1,0)corner_radius.Parent=track local fill=
Instance.new('Frame')fill.Name=Util.RandomName()fill.BorderSizePixel=0 fill.Size
=UDim2.new(0,0,1,0)fill.Parent=track window:RegisterThemeObject(fill,
'BackgroundColor3','AccentColor')local corner_radius_2=Instance.new('UICorner')
corner_radius_2.Name=Util.RandomName()corner_radius_2.CornerRadius=UDim.new(1,0)
corner_radius_2.Parent=fill function control:Set(v)control.Value=math.clamp(v,0,
1)Util.Tween(fill,kTweenSlow,{Size=UDim2.new(control.Value,0,1,0)})percent_label
.Text=math.round(control.Value*100)..'%'end control:Set(initial)return control
end function Elements.CreateChecklist(section,container,data)local name=data.
Name or'Checklist'local options=data.Options or{}local callback=data.Callback or
function()end local window=section.tab.window local state={}for _,option in
ipairs(options)do state[option.Name]=option.Default or false end local control={
Name=name,State=state,Type='Checklist',section=section}local frame=Instance.new(
'Frame')frame.Name=Util.RandomName()frame.BackgroundTransparency=1 frame.
BorderSizePixel=0 frame.Size=UDim2.new(1,0,0,18)frame.LayoutOrder=#container:
GetChildren()frame.ClipsDescendants=true frame.ZIndex=1 frame.Parent=container
control.frame=frame local interact=Instance.new('TextButton')interact.Name=Util.
RandomName()interact.BackgroundTransparency=1 interact.BorderSizePixel=0
interact.Size=UDim2.new(1,0,1,0)interact.Text=''interact.TextTransparency=1
interact.ZIndex=10 interact.Parent=frame local title_label=Instance.new(
'TextLabel')title_label.Name=Util.RandomName()title_label.AnchorPoint=Vector2.
new(0,1)title_label.BackgroundTransparency=1 title_label.BorderSizePixel=0
title_label.Position=UDim2.new(0,10,1,0)title_label.Size=UDim2.new(0.5,0,1,0)
title_label.Text=name title_label.TextSize=12 title_label.TextTruncate=Enum.
TextTruncate.AtEnd title_label.TextXAlignment=Enum.TextXAlignment.Left
title_label.Parent=frame window:RegisterThemeObject(title_label,'FontFace',
'FontSemiBold')window:RegisterThemeObject(title_label,'TextColor3','Text')local
row_frames={}for _,option in ipairs(options)do local row=Instance.new('Frame')
row.Name=Util.RandomName()row.BackgroundTransparency=1 row.BorderSizePixel=0 row
.Size=UDim2.new(1,0,0,20)row.LayoutOrder=#container:GetChildren()row.
ClipsDescendants=true row.ZIndex=1 row.Parent=container local box=Instance.new(
'Frame')box.Name=Util.RandomName()box.AnchorPoint=Vector2.new(0,0.5)box.
BorderSizePixel=0 box.Position=UDim2.new(0,10,0.5,0)box.Size=UDim2.new(0,12,0,12
)box.Parent=row if state[option.Name]then window:RegisterThemeObject(box,
'BackgroundColor3','ToggleEnabled')else window:RegisterThemeObject(box,
'BackgroundColor3','ToggleDisabled')end local corner_radius=Instance.new(
'UICorner')corner_radius.Name=Util.RandomName()corner_radius.CornerRadius=UDim.
new(0,2)corner_radius.Parent=box local border=Instance.new('UIStroke')border.
Name=Util.RandomName()border.Thickness=1 border.Parent=box if state[option.Name]
then window:RegisterThemeObject(border,'Color','ToggleEnabledStroke')else window
:RegisterThemeObject(border,'Color','ToggleDisabledStroke')end local check=
Instance.new('ImageLabel')check.Name=Util.RandomName()check.
BackgroundTransparency=1 check.Size=UDim2.new(1,0,1,0)check.Image=Assets.Get(6)
check.ImageColor3=Color3.new(1,1,1)check.Visible=state[option.Name]check.Parent=
box local label=Instance.new('TextLabel')label.Name=Util.RandomName()label.
BackgroundTransparency=1 label.Position=UDim2.new(0,28,0,0)label.Size=UDim2.new(
1,-32,1,0)label.Text=option.Name label.TextSize=11 label.TextTruncate=Enum.
TextTruncate.AtEnd label.TextXAlignment=Enum.TextXAlignment.Left label.Parent=
row window:RegisterThemeObject(label,'FontFace','FontSemiBold')window:
RegisterThemeObject(label,'TextColor3','Text')local interact=Instance.new(
'TextButton')interact.Name=Util.RandomName()interact.BackgroundTransparency=1
interact.BorderSizePixel=0 interact.Size=UDim2.new(1,0,1,0)interact.Text=''
interact.ZIndex=5 interact.Parent=row row_frames[option.Name]={row=row,box=box,
border=border,check=check}interact.MouseButton1Click:Connect(function()control:
Set(option.Name,not state[option.Name])end)interact.MouseEnter:Connect(function(
)Util.Tween(box,kTweenSlow,{BackgroundColor3=state[option.Name]and window.theme.
ToggleHoverEnabled or window.theme.ToggleHoverDisabled})end)interact.MouseLeave:
Connect(function()Util.Tween(box,kTweenSlow,{BackgroundColor3=state[option.Name]
and window.theme.ToggleEnabled or window.theme.ToggleDisabled})end)end function
control:Set(option_name,v)control.State[option_name]=v state[option_name]=v
local refs=row_frames[option_name]if refs then Util.Tween(refs.box,kTweenSlow,{
BackgroundColor3=v and window.theme.ToggleEnabled or window.theme.ToggleDisabled
})Util.Tween(refs.border,kTweenSlow,{Color=v and window.theme.
ToggleEnabledStroke or window.theme.ToggleDisabledStroke})refs.check.Visible=v
end Util.SafeCall(callback,control.State)end function control:SetAll(v)for k in
pairs(control.State)do control:Set(k,v)end end return control end function
Elements.CreateRadioGroup(section,container,data)local name=data.Name or'Radio'
local options=data.Options or{}local callback=data.Callback or function()end
local selected=data.Default or options[1]local window=section.tab.window local
control={Name=name,CurrentOption=selected,Type='RadioGroup',section=section}
local frame=Instance.new('Frame')frame.Name=Util.RandomName()frame.
BackgroundTransparency=1 frame.BorderSizePixel=0 frame.Size=UDim2.new(1,0,0,18)
frame.LayoutOrder=#container:GetChildren()frame.ClipsDescendants=true frame.
ZIndex=1 frame.Parent=container control.frame=frame local interact=Instance.new(
'TextButton')interact.Name=Util.RandomName()interact.BackgroundTransparency=1
interact.BorderSizePixel=0 interact.Size=UDim2.new(1,0,1,0)interact.Text=''
interact.TextTransparency=1 interact.ZIndex=10 interact.Parent=frame local
title_label=Instance.new('TextLabel')title_label.Name=Util.RandomName()
title_label.AnchorPoint=Vector2.new(0,1)title_label.BackgroundTransparency=1
title_label.BorderSizePixel=0 title_label.Position=UDim2.new(0,10,1,0)
title_label.Size=UDim2.new(0.5,0,1,0)title_label.Text=name title_label.TextSize=
12 title_label.TextTruncate=Enum.TextTruncate.AtEnd title_label.TextXAlignment=
Enum.TextXAlignment.Left title_label.Parent=frame window:RegisterThemeObject(
title_label,'FontFace','FontSemiBold')window:RegisterThemeObject(title_label,
'TextColor3','Text')local row_refs={}for _,option in ipairs(options)do local row
=Instance.new('Frame')row.Name=Util.RandomName()row.BackgroundTransparency=1 row
.BorderSizePixel=0 row.Size=UDim2.new(1,0,0,20)row.LayoutOrder=#container:
GetChildren()row.ClipsDescendants=true row.ZIndex=1 row.Parent=container local
active=option==selected local ring=Instance.new('Frame')ring.Name=Util.
RandomName()ring.AnchorPoint=Vector2.new(0,0.5)ring.BorderSizePixel=0 ring.
Position=UDim2.new(0,10,0.5,0)ring.Size=UDim2.new(0,12,0,12)ring.Parent=row if
active then window:RegisterThemeObject(ring,'BackgroundColor3','RadioEnabled')
else window:RegisterThemeObject(ring,'BackgroundColor3','RadioDisabled')end
local ring_corner=Instance.new('UICorner')ring_corner.Name=Util.RandomName()
ring_corner.CornerRadius=UDim.new(1,0)ring_corner.Parent=ring local border=
Instance.new('UIStroke')border.Name=Util.RandomName()border.Thickness=1 border.
Parent=ring if active then window:RegisterThemeObject(border,'Color',
'RadioEnabledStroke')else window:RegisterThemeObject(border,'Color',
'RadioDisabledStroke')end local dot=Instance.new('Frame')dot.Name=Util.
RandomName()dot.AnchorPoint=Vector2.new(0.5,0.5)dot.BackgroundColor3=Color3.new(
1,1,1)dot.BackgroundTransparency=active and 0 or 1 dot.BorderSizePixel=0 dot.
Position=UDim2.new(0.5,0,0.5,0)dot.Size=UDim2.new(0,5,0,5)dot.Parent=ring local
dot_corner=Instance.new('UICorner')dot_corner.Name=Util.RandomName()dot_corner.
CornerRadius=UDim.new(1,0)dot_corner.Parent=dot local label=Instance.new(
'TextLabel')label.Name=Util.RandomName()label.BackgroundTransparency=1 label.
Position=UDim2.new(0,28,0,0)label.Size=UDim2.new(1,-32,1,0)label.Text=option
label.TextSize=11 label.TextTruncate=Enum.TextTruncate.AtEnd label.
TextXAlignment=Enum.TextXAlignment.Left label.Parent=row window:
RegisterThemeObject(label,'FontFace','FontSemiBold')window:RegisterThemeObject(
label,'TextColor3','Text')local interact=Instance.new('TextButton')interact.
BackgroundTransparency=1 interact.BorderSizePixel=0 interact.Size=UDim2.new(1,0,
1,0)interact.Text=''interact.ZIndex=5 interact.Parent=row row_refs[option]={dot=
dot,border=border,ring=ring}interact.MouseButton1Click:Connect(function()control
:Set(option)end)interact.MouseEnter:Connect(function()local is_active=control.
CurrentOption==option Util.Tween(ring,kTweenSlow,{BackgroundColor3=is_active and
window.theme.RadioHoverEnabled or window.theme.RadioHoverDisabled})end)interact.
MouseLeave:Connect(function()local is_active=control.CurrentOption==option Util.
Tween(ring,kTweenSlow,{BackgroundColor3=is_active and window.theme.RadioEnabled
or window.theme.RadioDisabled})end)end function control:Set(newOption)control.
CurrentOption=newOption for optionName,refs in pairs(row_refs)do local active=
optionName==newOption Util.Tween(refs.ring,kTweenSlow,{BackgroundColor3=active
and window.theme.RadioEnabled or window.theme.RadioDisabled})Util.Tween(refs.dot
,kTweenSlow,{BackgroundTransparency=active and 0 or 1})Util.Tween(refs.border,
kTweenSlow,{Color=active and window.theme.RadioEnabledStroke or window.theme.
RadioDisabledStroke})end Util.SafeCall(callback,newOption)end return control end
function Elements.CreateTable(section,container,data)local name=data.Name or
'Table'local columns=data.Columns or{}local rows=data.Rows or{}local
column_height=18 local row_height=20 local header_height=column_height+2 local
visible_rows=4 local body_height=row_height*math.min(#rows,visible_rows)local
window=section.tab.window local control={Name=name,Type='Table',section=section}
local frame=Instance.new('Frame')frame.Name=Util.RandomName()frame.
BorderSizePixel=0 frame.Size=UDim2.new(1,0,0,25+header_height+body_height+4)
frame.LayoutOrder=#container:GetChildren()frame.ClipsDescendants=true frame.
ZIndex=1 frame.Parent=container control.frame=frame window:RegisterThemeObject(
frame,'BackgroundColor3','SectionBackground')local corner_radius=Instance.new(
'UICorner')corner_radius.Name=Util.RandomName()corner_radius.CornerRadius=UDim.
new(0,4)corner_radius.Parent=frame local border=Instance.new('UIStroke')border.
Name=Util.RandomName()border.Thickness=1 border.Parent=frame window:
RegisterThemeObject(border,'Color','SectionStroke')local title_bar=Instance.new(
'Frame')title_bar.Name=Util.RandomName()title_bar.BorderSizePixel=0 title_bar.
Size=UDim2.new(1,0,0,25)title_bar.Parent=frame window:RegisterThemeObject(
title_bar,'BackgroundColor3','SectionTopbar')local corner_radius_2=Instance.new(
'UICorner')corner_radius_2.Name=Util.RandomName()corner_radius_2.CornerRadius=
UDim.new(0,4)corner_radius_2.Parent=title_bar local title_label=Instance.new(
'TextLabel')title_label.Name=Util.RandomName()title_label.BackgroundTransparency
=1 title_label.Position=UDim2.new(0,8,0,0)title_label.Size=UDim2.new(1,-12,1,0)
title_label.Text=name title_label.TextSize=12 title_label.TextXAlignment=Enum.
TextXAlignment.Left title_label.Parent=title_bar window:RegisterThemeObject(
title_label,'FontFace','FontSemiBold')window:RegisterThemeObject(title_label,
'TextColor3','Text')local header=Instance.new('Frame')header.Name=Util.
RandomName()header.BorderSizePixel=0 header.Position=UDim2.new(0,0,0,25)header.
Size=UDim2.new(1,0,0,column_height)header.Parent=frame window:
RegisterThemeObject(header,'BackgroundColor3','DropdownSelected')local
grid_layout=Instance.new('UIGridLayout')grid_layout.Name=Util.RandomName()
grid_layout.CellPadding=UDim2.new(0,0,0,0)grid_layout.CellSize=UDim2.new(1/math.
max(#columns,1),0,1,0)grid_layout.FillDirection=Enum.FillDirection.Horizontal
grid_layout.SortOrder=Enum.SortOrder.LayoutOrder grid_layout.Parent=header for i
,column in ipairs(columns)do local cell=Instance.new('TextLabel')cell.Name=Util.
RandomName()cell.BackgroundTransparency=1 cell.BorderSizePixel=0 cell.
LayoutOrder=i cell.Text=column cell.TextSize=10 cell.TextXAlignment=Enum.
TextXAlignment.Left cell.Parent=header window:RegisterThemeObject(cell,
'FontFace','FontSemiBold')window:RegisterThemeObject(cell,'TextColor3','SubText'
)local padding=Instance.new('UIPadding')padding.Name=Util.RandomName()padding.
PaddingLeft=UDim.new(0,4)padding.Parent=cell end local body=Instance.new(
'ScrollingFrame')body.Name=Util.RandomName()body.BackgroundTransparency=1 body.
BorderSizePixel=0 body.Position=UDim2.new(0,0,0,25+column_height)body.Size=UDim2
.new(1,0,0,body_height+4)body.ScrollBarThickness=3 body.ScrollingDirection=Enum.
ScrollingDirection.Y body.CanvasSize=UDim2.new(0,0,0,0)body.Parent=frame window:
RegisterThemeObject(body,'ScrollBarImageColor3','Background')local list_layout=
Instance.new('UIListLayout')list_layout.Name=Util.RandomName()list_layout.
FillDirection=Enum.FillDirection.Vertical list_layout.SortOrder=Enum.SortOrder.
LayoutOrder list_layout.Parent=body local function BuildRows(r)for _,child in
ipairs(body:GetChildren())do if child:IsA('Frame')then child:Destroy()end end
for i,row in ipairs(r)do local row_frame=Instance.new('Frame')row_frame.
BorderSizePixel=0 row_frame.LayoutOrder=i row_frame.Size=UDim2.new(1,0,0,
row_height)if i%2==0 then window:RegisterThemeObject(row_frame,
'BackgroundColor3','DropdownSelected')else window:RegisterThemeObject(row_frame,
'BackgroundColor3','DropdownUnselected')end local grid_layout_2=Instance.new(
'UIGridLayout')grid_layout_2.CellPadding=UDim2.new(0,0,0,0)grid_layout_2.
CellSize=UDim2.new(1/math.max(#columns,1),0,1,0)grid_layout_2.FillDirection=Enum
.FillDirection.Horizontal grid_layout_2.SortOrder=Enum.SortOrder.LayoutOrder
grid_layout_2.Parent=row_frame for j,cell_val in ipairs(row)do local cell=
Instance.new('TextLabel')cell.Name=Util.RandomName()cell.BackgroundTransparency=
1 cell.LayoutOrder=j cell.Text=tostring(cell_val)cell.TextSize=10 cell.
TextXAlignment=Enum.TextXAlignment.Left cell.Parent=row_frame window:
RegisterThemeObject(cell,'FontFace','FontRegular')window:RegisterThemeObject(
cell,'TextColor3','Text')local padding=Instance.new('UIPadding')padding.Name=
Util.RandomName()padding.PaddingLeft=UDim.new(0,4)padding.Parent=cell end
row_frame.Parent=body end body.CanvasSize=UDim2.new(0,0,0,row_height*#r)end
BuildRows(rows)function control:SetRows(new_rows)rows=new_rows BuildRows(rows)
end function control:AddRow(row)rows[#rows+1]=row BuildRows(rows)end return
control end function Elements.CreateSpinner(section,container,data)local name=
data.Name or'Loading'local window=section.tab.window local control={Name=name,
Type='Spinner',section=section}local frame=Instance.new('Frame')frame.Name=Util.
RandomName()frame.BackgroundTransparency=1 frame.BorderSizePixel=0 frame.Size=
UDim2.new(1,0,0,25)frame.LayoutOrder=#container:GetChildren()frame.
ClipsDescendants=true frame.ZIndex=1 frame.Parent=container control.frame=frame
local interact=Instance.new('TextButton')interact.Name=Util.RandomName()interact
.BackgroundTransparency=1 interact.BorderSizePixel=0 interact.Size=UDim2.new(1,0
,1,0)interact.Text=''interact.TextTransparency=1 interact.ZIndex=10 interact.
Parent=frame local title_label=Instance.new('TextLabel')title_label.Name=Util.
RandomName()title_label.AnchorPoint=Vector2.new(0,1)title_label.
BackgroundTransparency=1 title_label.BorderSizePixel=0 title_label.Position=
UDim2.new(0,10,1,0)title_label.Size=UDim2.new(0.5,0,1,0)title_label.Text=name
title_label.TextSize=12 title_label.TextTruncate=Enum.TextTruncate.AtEnd
title_label.TextXAlignment=Enum.TextXAlignment.Left title_label.Parent=frame
window:RegisterThemeObject(title_label,'FontFace','FontSemiBold')window:
RegisterThemeObject(title_label,'TextColor3','Text')local spinner=Instance.new(
'ImageLabel')spinner.Name=Util.RandomName()spinner.AnchorPoint=Vector2.new(1,0.5
)spinner.BackgroundTransparency=1 spinner.BorderSizePixel=0 spinner.Position=
UDim2.new(1,-8,0.5,0)spinner.Size=UDim2.new(0,14,0,14)spinner.Image=Assets.Get(7
)spinner.ZIndex=2 spinner.Parent=frame local RunService=game:GetService(
'RunService')local spin_conn function control:SetVisible(visible)frame.Visible=
visible if visible then if spin_conn then return end spin_conn=RunService.
RenderStepped:Connect(function(dt)spinner.Rotation=spinner.Rotation+300*dt end)
else if not spin_conn then return end spin_conn:Disconnect()spin_conn=nil end
end frame.Destroying:Connect(function()if spin_conn then spin_conn:Disconnect()
spin_conn=nil end end)control:SetVisible(data.Visible~=false)return control end
local Section={}Section.__index=Section function Section.New(name,icon,tab)local
window=tab.window local self=setmetatable({name=name,icon=icon,tab=tab},Section)
local frame=Instance.new('CanvasGroup')frame.Name=Util.RandomName()frame.
AutomaticSize=Enum.AutomaticSize.Y frame.Size=UDim2.new(1,0,0,0)frame.
BorderSizePixel=0 frame.Parent=(#tab.sections%2==0)and tab.left_container or tab
.right_container self.frame=frame window:RegisterThemeObject(frame,
'BackgroundColor3','SectionBackground')local border=Instance.new('UIStroke')
border.Name=Util.RandomName()border.Thickness=1 border.Parent=frame window:
RegisterThemeObject(border,'Color','SectionStroke')local corner_radius=Instance.
new('UICorner')corner_radius.Name=Util.RandomName()corner_radius.CornerRadius=
UDim.new(0,8)corner_radius.Parent=frame local list_layout=Instance.new(
'UIListLayout')list_layout.Name=Util.RandomName()list_layout.Padding=UDim.new(0,
0)list_layout.FillDirection=Enum.FillDirection.Vertical list_layout.SortOrder=
Enum.SortOrder.LayoutOrder list_layout.Parent=frame local topbar=Instance.new(
'Frame')topbar.Name=Util.RandomName()topbar.BorderSizePixel=0 topbar.LayoutOrder
=0 topbar.Size=UDim2.new(1,0,0,30)topbar.ClipsDescendants=true topbar.Parent=
frame window:RegisterThemeObject(topbar,'BackgroundColor3','SectionTopbar')local
list_layout_2=Instance.new('UIListLayout')list_layout_2.Name=Util.RandomName()
list_layout_2.Padding=UDim.new(0,5)list_layout_2.FillDirection=Enum.
FillDirection.Horizontal list_layout_2.SortOrder=Enum.SortOrder.LayoutOrder
list_layout_2.VerticalAlignment=Enum.VerticalAlignment.Center list_layout_2.
Parent=topbar local padding=Instance.new('UIPadding')padding.Name=Util.
RandomName()padding.PaddingLeft=UDim.new(0,5)padding.PaddingRight=UDim.new(0,5)
padding.Parent=topbar if icon then local icon_label=Instance.new('ImageLabel')
icon_label.Name=Util.RandomName()icon_label.BackgroundTransparency=1 icon_label.
BorderSizePixel=0 icon_label.LayoutOrder=0 icon_label.Size=UDim2.new(0,16,0,16)
icon_label.Image=Assets.Get(icon)icon_label.Parent=topbar local constraint=
Instance.new('UIAspectRatioConstraint')constraint.Name=Util.RandomName()
constraint.AspectRatio=1 constraint.Parent=icon_label local gradient=Instance.
new('UIGradient')gradient.Name=Util.RandomName()gradient.Rotation=90 gradient.
Parent=icon_label window:RegisterThemeObject(gradient,'Color','TabText')end
local title_label=Instance.new('TextLabel')title_label.Name=Util.RandomName()
title_label.AnchorPoint=Vector2.new(0,1)title_label.BackgroundTransparency=1
title_label.BorderSizePixel=0 title_label.LayoutOrder=1 title_label.Size=UDim2.
new(0,150,0,20)title_label.Text=name title_label.TextSize=14 title_label.
TextTruncate=Enum.TextTruncate.AtEnd title_label.TextXAlignment=Enum.
TextXAlignment.Left title_label.Parent=topbar window:RegisterThemeObject(
title_label,'FontFace','FontSemiBold')window:RegisterThemeObject(title_label,
'TextColor3','Text')local container=Instance.new('Frame')container.Name=Util.
RandomName()container.BackgroundTransparency=1 container.BorderSizePixel=0
container.AutomaticSize=Enum.AutomaticSize.Y container.Size=UDim2.new(1,0,0,0)
container.ClipsDescendants=true container.LayoutOrder=1 container.Parent=frame
self.container=container local padding_2=Instance.new('UIPadding')padding_2.Name
=Util.RandomName()padding_2.PaddingBottom=UDim.new(0,5)padding_2.PaddingLeft=
UDim.new(0,5)padding_2.PaddingRight=UDim.new(0,5)padding_2.PaddingTop=UDim.new(0
,5)padding_2.Parent=container local list_layout_3=Instance.new('UIListLayout')
list_layout_3.Name=Util.RandomName()list_layout_3.Padding=UDim.new(0,5)
list_layout_3.FillDirection=Enum.FillDirection.Vertical list_layout_3.SortOrder=
Enum.SortOrder.LayoutOrder list_layout_3.Parent=container return self end
function Section:CreateEmpty()local empty=Instance.new('Frame')empty.Name=Util.
RandomName()empty.BackgroundTransparency=1 empty.BorderSizePixel=0 empty.Size=
UDim2.new(1,0,0,25)empty.LayoutOrder=#self.container:GetChildren()empty.
ClipsDescendants=true empty.ZIndex=1 empty.Parent=self.container end function
Section:CreateDivider()local window=self.tab.window local divider=Instance.new(
'Frame')divider.Name=Util.RandomName()divider.BackgroundTransparency=1 divider.
BorderSizePixel=0 divider.Size=UDim2.new(1,0,0,8)divider.LayoutOrder=#self.
container:GetChildren()divider.ClipsDescendants=true divider.ZIndex=1 divider.
Parent=self.container local line=Instance.new('Frame')line.Name=Util.RandomName(
)line.AnchorPoint=Vector2.new(0.5,0.5)line.BorderSizePixel=0 line.Position=UDim2
.new(0.5,0,0.5,0)line.Size=UDim2.new(1,-16,0,2)line.Parent=divider window:
RegisterThemeObject(line,'BackgroundColor3','ElementStroke')end function Section
:CreateButton(data)local control=Elements.CreateButton(self,self.container,data)
return self.tab:_Register(control,data.Flag)end function Section:CreateToggle(
data)local control=Elements.CreateToggle(self,self.container,data)return self.
tab:_Register(control,data.Flag)end function Section:CreateSlider(data)local
control=Elements.CreateSlider(self,self.container,data)return self.tab:
_Register(control,data.Flag)end function Section:CreateDropdown(data)local
control=Elements.CreateDropdown(self,self.container,data)return self.tab:
_Register(control,data.Flag)end function Section:CreateInput(data)local control=
Elements.CreateInput(self,self.container,data)return self.tab:_Register(control,
data.Flag)end function Section:CreateMultiLineInput(data)local control=Elements.
CreateMultiLineInput(self,self.container,data)return self.tab:_Register(control,
data.Flag)end function Section:CreateKeybind(data)local control=Elements.
CreateKeybind(self,self.container,data)return self.tab:_Register(control,data.
Flag)end function Section:CreateColorPicker(data)local control=Elements.
CreateColorPicker(self,self.container,data)return self.tab:_Register(control,
data.Flag)end function Section:CreateLabel(data)local control=Elements.
CreateLabel(self,self.container,data)return self.tab:_Register(control,data.Flag
)end function Section:CreateParagraph(data)local control=Elements.
CreateParagraph(self,self.container,data)return self.tab:_Register(control,data.
Flag)end function Section:CreateSearchBox(data)local control=Elements.
CreateSearchBox(self,self.container,data)return self.tab:_Register(control,data.
Flag)end function Section:CreateImage(data)local control=Elements.CreateImage(
self,self.container,data)return self.tab:_Register(control,data.Flag)end
function Section:CreateProgressBar(data)local control=Elements.
CreateProgressBar(self,self.container,data)return self.tab:_Register(control,
data.Flag)end function Section:CreateChecklist(data)local control=Elements.
CreateChecklist(self,self.container,data)return self.tab:_Register(control,data.
Flag)end function Section:CreateRadioGroup(data)local control=Elements.
CreateRadioGroup(self,self.container,data)return self.tab:_Register(control,data
.Flag)end function Section:CreateTable(data)local control=Elements.CreateTable(
self,self.container,data)return self.tab:_Register(control,data.Flag)end
function Section:CreateSpinner(data)local control=Elements.CreateSpinner(self,
self.container,data)return self.tab:_Register(control,data.Flag)end local Tab={}
Tab.__index=Tab function Tab.New(name,description,tab_list,window,flags)local
self=setmetatable({name=name,description=description,tab_list=tab_list,window=
window,flags=flags,sections={}},Tab)local button=Instance.new('TextButton')
button.Name=Util.RandomName()button.AutoButtonColor=false button.
BackgroundTransparency=1 button.BorderColor3=Color3.fromRGB(0,0,0)button.
BorderSizePixel=0 button.LayoutOrder=#window.tab_order+1 button.Position=UDim2.
new(0,0,0,0)button.Size=UDim2.new(0,35,0,35)button.ClipsDescendants=true button.
Text=''button.TextTransparency=1 button.Parent=tab_list self.button=button
window:RegisterThemeObject(button,'BackgroundColor3','TabBackgroundSelected')
local border=Instance.new('UIStroke')border.Name=Util.RandomName()border.
Thickness=1 border.Transparency=1 border.Parent=button self.border=border window
:RegisterThemeObject(border,'Color','TabStroke')local constraint=Instance.new(
'UIAspectRatioConstraint')constraint.Name=Util.RandomName()constraint.
AspectRatio=1 constraint.Parent=button local corner_radius=Instance.new(
'UICorner')corner_radius.Name=Util.RandomName()corner_radius.CornerRadius=UDim.
new(1,0)corner_radius.Parent=button self.corner_radius=corner_radius local icon=
Instance.new('ImageLabel')icon.Name=Util.RandomName()icon.AnchorPoint=Vector2.
new(0.5,0.5)icon.BackgroundTransparency=1 icon.BorderSizePixel=0 icon.Position=
UDim2.new(0.5,0,0.5,0)icon.Size=UDim2.new(0.6,0,0.6,0)icon.Parent=button self.
icon=icon local constraint=Instance.new('UIAspectRatioConstraint')constraint.
Name=Util.RandomName()constraint.AspectRatio=1 constraint.Parent=icon local
gradient=Instance.new('UIGradient')gradient.Name=Util.RandomName()gradient.
Rotation=90 gradient.Transparency=NumberSequence.new(0.5)gradient.Parent=icon
self.gradient=gradient window:RegisterThemeObject(gradient,'Color','TabText')
local left_container=Instance.new('ScrollingFrame')left_container.Name=Util.
RandomName()left_container.Active=true left_container.AnchorPoint=Vector2.new(0,
0.5)left_container.BackgroundTransparency=1 left_container.BorderSizePixel=0
left_container.Position=UDim2.new(0,0,0.5,0)left_container.Size=UDim2.new(0.5,0,
1,0)left_container.Visible=false left_container.ScrollBarThickness=5
left_container.ScrollingDirection=Enum.ScrollingDirection.Y left_container.
Parent=window.tab_content self.left_container=left_container window:
RegisterThemeObject(left_container,'ScrollBarImageColor3','Stroke')local
list_layout=Instance.new('UIListLayout')list_layout.Name=Util.RandomName()
list_layout.Padding=UDim.new(0,5)list_layout.FillDirection=Enum.FillDirection.
Vertical list_layout.SortOrder=Enum.SortOrder.LayoutOrder list_layout.Parent=
left_container local padding=Instance.new('UIPadding')padding.Name=Util.
RandomName()padding.PaddingBottom=UDim.new(0,2)padding.PaddingLeft=UDim.new(0,2)
padding.PaddingRight=UDim.new(0,2)padding.PaddingTop=UDim.new(0,2)padding.Parent
=left_container local right_container=Instance.new('ScrollingFrame')
right_container.Name=Util.RandomName()right_container.Active=true
right_container.AnchorPoint=Vector2.new(1,0.5)right_container.
BackgroundTransparency=1 right_container.BorderSizePixel=0 right_container.
Position=UDim2.new(1,0,0.5,0)right_container.Size=UDim2.new(0.5,0,1,0)
right_container.Visible=false right_container.ScrollBarThickness=5
right_container.ScrollingDirection=Enum.ScrollingDirection.Y right_container.
Parent=window.tab_content self.right_container=right_container window:
RegisterThemeObject(right_container,'ScrollBarImageColor3','Stroke')local
list_layout_2=Instance.new('UIListLayout')list_layout_2.Name=Util.RandomName()
list_layout_2.Padding=UDim.new(0,5)list_layout_2.FillDirection=Enum.
FillDirection.Vertical list_layout_2.SortOrder=Enum.SortOrder.LayoutOrder
list_layout_2.Parent=right_container local padding_2=Instance.new('UIPadding')
padding_2.Name=Util.RandomName()padding_2.PaddingBottom=UDim.new(0,2)padding_2.
PaddingLeft=UDim.new(0,2)padding_2.PaddingRight=UDim.new(0,2)padding_2.
PaddingTop=UDim.new(0,2)padding_2.Parent=right_container button.
MouseButton1Click:Connect(function()window:SwitchTab(name,description)end)
list_layout:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
left_container.CanvasSize=UDim2.new(left_container.CanvasSize.X.Scale,
left_container.CanvasSize.X.Offset,left_container.CanvasSize.Y.Offset,
list_layout.AbsoluteContentSize.Y)end)list_layout_2:GetPropertyChangedSignal(
'AbsoluteContentSize'):Connect(function()right_container.CanvasSize=UDim2.new(
right_container.CanvasSize.X.Scale,right_container.CanvasSize.X.Offset,
right_container.CanvasSize.Y.Offset,list_layout_2.AbsoluteContentSize.Y)end)
return self end function Tab:_Register(ctrl,flag)local name=string.lower(ctrl.
Name)local index=name local count=1 while self.window.controls[index]do index=
string.format('%s(%d)',name,count)count=count+1 end self.window.controls[index]=
{tab=self,section=ctrl.section,control=ctrl}if flag and flag~=''then self.flags[
flag]=ctrl local loaded=self.window._loaded_config if loaded and loaded[flag]~=
nil then Config.ApplyValue(ctrl,loaded[flag])end if type(ctrl.Set)=='function'
then local pre_autosave_set=ctrl.Set local window_ref=self.window ctrl.Set=
function(self_ctrl,...)pre_autosave_set(self_ctrl,...)if window_ref.
_QueueAutoSave then window_ref:_QueueAutoSave()end end end end if ctrl.Type==
'Keybind'and self.window.keybinds_window then self.window.keybinds_window:Add(
ctrl)end return ctrl end function Tab:CreateSection(name,icon)if not self.
left_container or not self.right_container then return end local section=Section
.New(name,icon,self)table.insert(self.sections,section)return section end local
Window={}Window.__index=Window function Window.New(config,theme,flags)local self
=setmetatable({config=config,theme=theme,flags=flags,tabs={},tab_order={},
controls={},active_tab=nil,switching=false,open=true,minimised=false,connections
={},_autosave_dirty=false,_autosave_debounce=false,_theme_objects={},
_loaded_config={},_loaded_positions=nil},Window)config.Size=config.Size or UDim2
.new(0,450,0,500)if config.AutoLoadConfig~=false and config.ConfigFolder and
config.ConfigFile then local raw=Config.ReadRaw(config.ConfigFolder,config.
ConfigFile)if raw then self._loaded_positions=raw.__Positions raw.__Positions=
nil self._loaded_config=raw end end local screen_gui=Instance.new('ScreenGui')
screen_gui.Name='aeui'screen_gui.ResetOnSpawn=false screen_gui.DisplayOrder=9999
screen_gui.IgnoreGuiInset=true screen_gui.ZIndexBehavior=Enum.ZIndexBehavior.
Sibling screen_gui.AutoLocalize=false screen_gui.Parent=GetProtectedParent()self
.screen_gui=screen_gui self._original_mouse_icon=UserInputService.MouseIcon self
._original_mouse_icon_enabled=UserInputService.MouseIconEnabled local main=
Instance.new('CanvasGroup')main.Name=Util.RandomName()main.GroupTransparency=1
main.Size=config.Size main.Position=(self._loaded_positions and Util.
TableToUDim2(self._loaded_positions.Window))or UDim2.new(0.5,0,0.2,0)main.
AnchorPoint=Vector2.new(0.5,0)main.BorderSizePixel=0 main.Visible=false main.
Parent=screen_gui self.main=main self:RegisterThemeObject(main,
'BackgroundColor3','Background')local corner_radius=Instance.new('UICorner')
corner_radius.Name=Util.RandomName()corner_radius.CornerRadius=UDim.new(0,8)
corner_radius.Parent=main local border=Instance.new('UIStroke')border.Name=Util.
RandomName()border.Thickness=1 border.Transparency=1 border.Parent=main self.
border=border self:RegisterThemeObject(border,'Color','Stroke')local
modal_button=Instance.new('TextButton')modal_button.Name=Util.RandomName()
modal_button.AutoButtonColor=true modal_button.BackgroundTransparency=1
modal_button.BorderSizePixel=0 modal_button.Modal=true modal_button.Size=UDim2.
new(0,1,0,1)modal_button.Text=''modal_button.TextTransparency=1 modal_button.
Parent=main local topbar=Instance.new('Frame')topbar.Name=Util.RandomName()
topbar.AnchorPoint=Vector2.new(0.5,0)topbar.BackgroundTransparency=1 topbar.
BorderSizePixel=0 topbar.Position=UDim2.new(0.5,0,0,0)topbar.Size=UDim2.new(1,0,
0,40)topbar.ClipsDescendants=true topbar.Parent=main self.topbar=topbar local
border_2=Instance.new('UIStroke')border_2.Name=Util.RandomName()border_2.
Thickness=1 border_2.Parent=topbar self:RegisterThemeObject(border_2,'Color',
'Stroke')local topbar_main=Instance.new('Frame')topbar_main.Name=Util.
RandomName()topbar_main.AnchorPoint=Vector2.new(0,0.5)topbar_main.
BackgroundTransparency=1 topbar_main.BorderSizePixel=0 topbar_main.Position=
UDim2.new(0,0,0.5,0)topbar_main.Size=UDim2.new(1,-185,1,0)topbar_main.
ClipsDescendants=true topbar_main.Parent=topbar local list_layout=Instance.new(
'UIListLayout')list_layout.Name=Util.RandomName()list_layout.Padding=UDim.new(0,
5)list_layout.FillDirection=Enum.FillDirection.Horizontal list_layout.SortOrder=
Enum.SortOrder.LayoutOrder list_layout.VerticalAlignment=Enum.VerticalAlignment.
Center list_layout.Parent=topbar_main local logo=Instance.new('ImageLabel')logo.
Name=Util.RandomName()logo.BackgroundTransparency=1 logo.BorderSizePixel=0 logo.
LayoutOrder=0 logo.Size=UDim2.new(0,40,0,40)logo.Image=Assets.Get(config.Icon)
logo.Parent=topbar_main local constraint=Instance.new('UIAspectRatioConstraint')
constraint.Name=Util.RandomName()constraint.AspectRatio=1 constraint.Parent=logo
local current_task=Instance.new('Frame')current_task.Name=Util.RandomName()
current_task.BackgroundTransparency=1 current_task.BorderSizePixel=0
current_task.LayoutOrder=1 current_task.Size=UDim2.new(0,150,1,0)current_task.
Parent=topbar_main local list_layout_2=Instance.new('UIListLayout')list_layout_2
.Name=Util.RandomName()list_layout_2.Padding=UDim.new(0,-5)list_layout_2.
FillDirection=Enum.FillDirection.Vertical list_layout_2.SortOrder=Enum.SortOrder
.LayoutOrder list_layout_2.VerticalAlignment=Enum.VerticalAlignment.Center
list_layout_2.Parent=current_task local title=Instance.new('TextLabel')title.
Name=Util.RandomName()title.AnchorPoint=Vector2.new(0,1)title.
BackgroundTransparency=1 title.BorderSizePixel=0 title.LayoutOrder=0 title.
Position=UDim2.new(0,0,1,0)title.Size=UDim2.new(0,180,0,20)title.Text=
'No Tab Selected'title.TextSize=14 title.TextTruncate=Enum.TextTruncate.AtEnd
title.TextXAlignment=Enum.TextXAlignment.Left title.Parent=current_task self.
task_title=title self:RegisterThemeObject(title,'FontFace','FontSemiBold')self:
RegisterThemeObject(title,'TextColor3','Text')local description=Instance.new(
'TextLabel')description.Name=Util.RandomName()description.AnchorPoint=Vector2.
new(0,1)description.BackgroundTransparency=1 description.BorderSizePixel=0
description.LayoutOrder=1 description.Position=UDim2.new(0,0,1,0)description.
Size=UDim2.new(0,180,0,20)description.Text='No Description'description.TextSize=
14 description.TextTruncate=Enum.TextTruncate.AtEnd description.TextXAlignment=
Enum.TextXAlignment.Left description.Parent=current_task self.task_description=
description self:RegisterThemeObject(description,'FontFace','FontRegular')self:
RegisterThemeObject(description,'TextColor3','SubText')local search_bar=Instance
.new('Frame')search_bar.Name=Util.RandomName()search_bar.BorderSizePixel=0
search_bar.AnchorPoint=Vector2.new(1,0.5)search_bar.Position=UDim2.new(1,-5,0.5,
0)search_bar.Size=UDim2.new(0,180,0,30)search_bar.ClipsDescendants=true
search_bar.ZIndex=1 search_bar.Parent=topbar self:RegisterThemeObject(search_bar
,'BackgroundColor3','InputBackground')local corner_radius_2=Instance.new(
'UICorner')corner_radius_2.Name=Util.RandomName()corner_radius_2.CornerRadius=
UDim.new(0,4)corner_radius_2.Parent=search_bar local border_3=Instance.new(
'UIStroke')border_3.Name=Util.RandomName()border_3.Thickness=1 border_3.Parent=
search_bar self:RegisterThemeObject(border_3,'Color','InputStroke')local icon=
Instance.new('ImageLabel')icon.Name=Util.RandomName()icon.BackgroundTransparency
=1 icon.Position=UDim2.new(0,6,0.5,-7)icon.Size=UDim2.new(0,14,0,14)icon.Image=
Assets.Get(4)icon.Parent=search_bar local box=Instance.new('TextBox')box.Name=
Util.RandomName()box.BackgroundTransparency=1 box.BorderSizePixel=0 box.
ClearTextOnFocus=false box.PlaceholderText='Search...'box.Position=UDim2.new(0,
24,0,0)box.Size=UDim2.new(1,-48,1,0)box.Text=''box.TextSize=12 box.
TextXAlignment=Enum.TextXAlignment.Left box.Parent=search_bar self:
RegisterThemeObject(box,'FontFace','FontRegular')self:RegisterThemeObject(box,
'PlaceholderColor3','SubText')self:RegisterThemeObject(box,'TextColor3','Text')
local clear_btn=Instance.new('ImageButton')clear_btn.Name=Util.RandomName()
clear_btn.AnchorPoint=Vector2.new(1,0.5)clear_btn.AutoButtonColor=false
clear_btn.BackgroundTransparency=1 clear_btn.Position=UDim2.new(1,-4,0.5,0)
clear_btn.Size=UDim2.new(0,18,0,18)clear_btn.Image=Assets.Get(5)clear_btn.Parent
=search_bar self:RegisterThemeObject(clear_btn,'ImageColor3','SubText')local
tabs=Instance.new('Frame')tabs.Name=Util.RandomName()tabs.BackgroundTransparency
=1 tabs.BorderSizePixel=0 tabs.Position=UDim2.new(0,0,0,40)tabs.Size=UDim2.new(1
,0,1,-60)tabs.ClipsDescendants=true tabs.Parent=main local tab_list=Instance.
new('ScrollingFrame')tab_list.Name=Util.RandomName()tab_list.Active=true
tab_list.AnchorPoint=Vector2.new(0,0.5)tab_list.BackgroundTransparency=1
tab_list.BorderSizePixel=0 tab_list.Position=UDim2.new(0,0,0.5,0)tab_list.Size=
UDim2.new(0,40,1,0)tab_list.ScrollBarThickness=0 tab_list.ScrollingDirection=
Enum.ScrollingDirection.Y tab_list.Parent=tabs self.tab_list=tab_list local
border_4=Instance.new('UIStroke')border_4.Name=Util.RandomName()border_4.
Thickness=1 border_4.Parent=tab_list self:RegisterThemeObject(border_4,'Color',
'Stroke')local padding=Instance.new('UIPadding')padding.Name=Util.RandomName()
padding.PaddingTop=UDim.new(0,4)padding.Parent=tab_list local list_layout_3=
Instance.new('UIListLayout')list_layout_3.Name=Util.RandomName()list_layout_3.
Padding=UDim.new(0,5)list_layout_3.FillDirection=Enum.FillDirection.Vertical
list_layout_3.SortOrder=Enum.SortOrder.LayoutOrder list_layout_3.
HorizontalAlignment=Enum.HorizontalAlignment.Center list_layout_3.Parent=
tab_list local tab_content=Instance.new('CanvasGroup')tab_content.Name=Util.
RandomName()tab_content.AnchorPoint=Vector2.new(0,0.5)tab_content.
BackgroundTransparency=1 tab_content.BorderSizePixel=0 tab_content.Position=
UDim2.new(0,40,0.5,0)tab_content.Size=UDim2.new(1,-40,1,0)tab_content.Parent=
tabs self.tab_content=tab_content local padding_2=Instance.new('UIPadding')
padding_2.Name=Util.RandomName()padding_2.PaddingBottom=UDim.new(0,4)padding_2.
PaddingLeft=UDim.new(0,4)padding_2.PaddingTop=UDim.new(0,4)padding_2.Parent=
tab_content local status_bar=Instance.new('Frame')status_bar.Name=Util.
RandomName()status_bar.AnchorPoint=Vector2.new(0.5,1)status_bar.BorderSizePixel=
0 status_bar.Position=UDim2.new(0.5,0,1,0)status_bar.Size=UDim2.new(1,0,0,20)
status_bar.Parent=main self:RegisterThemeObject(status_bar,'BackgroundColor3',
'Stroke')local game_label=Instance.new('TextLabel')game_label.Name=Util.
RandomName()game_label.AnchorPoint=Vector2.new(0,1)game_label.
BackgroundTransparency=1 game_label.BorderSizePixel=0 game_label.LayoutOrder=1
game_label.Position=UDim2.new(0,10,1,0)game_label.Size=UDim2.new(0.8,0,0,20)
game_label.Text=config.Title game_label.TextSize=14 game_label.TextTransparency=
0.5 game_label.TextTruncate=Enum.TextTruncate.AtEnd game_label.TextXAlignment=
Enum.TextXAlignment.Left game_label.Parent=status_bar self:RegisterThemeObject(
game_label,'FontFace','FontRegular')self:RegisterThemeObject(game_label,
'TextColor3','Text')local version_label=Instance.new('TextLabel')version_label.
Name=Util.RandomName()version_label.AnchorPoint=Vector2.new(1,1)version_label.
BackgroundTransparency=1 version_label.BorderSizePixel=0 version_label.
LayoutOrder=1 version_label.Position=UDim2.new(1,-10,1,0)version_label.Size=
UDim2.new(0.2,0,0,20)version_label.Text=config.Version version_label.TextSize=14
version_label.TextTransparency=0.5 version_label.TextTruncate=Enum.TextTruncate.
AtEnd version_label.TextXAlignment=Enum.TextXAlignment.Right version_label.
Parent=status_bar self:RegisterThemeObject(version_label,'FontFace',
'FontRegular')self:RegisterThemeObject(version_label,'TextColor3','Text')local
info_bar=Instance.new('CanvasGroup')info_bar.Name=Util.RandomName()info_bar.
GroupTransparency=1 info_bar.AutomaticSize=Enum.AutomaticSize.X info_bar.Size=
UDim2.fromOffset(0,25)info_bar.Position=(self._loaded_positions and Util.
TableToUDim2(self._loaded_positions.InfoBar))or UDim2.new(0.5,0,0,40)info_bar.
AnchorPoint=Vector2.new(0.5,0)info_bar.BorderSizePixel=0 info_bar.Parent=
screen_gui self.info_bar=info_bar self:RegisterThemeObject(info_bar,
'BackgroundColor3','Background')local corner_radius_3=Instance.new('UICorner')
corner_radius_3.Name=Util.RandomName()corner_radius_3.CornerRadius=UDim.new(0,4)
corner_radius_3.Parent=info_bar local border_5=Instance.new('UIStroke')border_5.
Name=Util.RandomName()border_5.Thickness=1 border_5.Transparency=1 border_5.
Parent=info_bar self.info_bar_border=border_5 self:RegisterThemeObject(border_5,
'Color','Stroke')local info_bar_layout=Instance.new('UIListLayout')
info_bar_layout.FillDirection=Enum.FillDirection.Horizontal info_bar_layout.
SortOrder=Enum.SortOrder.LayoutOrder info_bar_layout.Parent=info_bar local
info_drag=Instance.new('Frame')info_drag.Name=Util.RandomName()info_drag.
AnchorPoint=Vector2.new(0.5,0.5)info_drag.BackgroundTransparency=1 info_drag.
BorderSizePixel=0 info_drag.ZIndex=9999 info_drag.AutomaticSize=Enum.
AutomaticSize.X info_drag.Position=UDim2.new(0.5,0,0.5,0)info_drag.Size=UDim2.
fromScale(0,1)info_drag.ClipsDescendants=true info_drag.Parent=info_bar local
drag_padding=Instance.new('UIPadding')drag_padding.Name=Util.RandomName()
drag_padding.PaddingLeft=UDim.new(0,14)drag_padding.PaddingRight=UDim.new(0,14)
drag_padding.Parent=info_drag local drag_layout=Instance.new('UIListLayout')
drag_layout.Name=Util.RandomName()drag_layout.FillDirection=Enum.FillDirection.
Horizontal drag_layout.VerticalAlignment=Enum.VerticalAlignment.Center
drag_layout.SortOrder=Enum.SortOrder.LayoutOrder drag_layout.Padding=UDim.new(0,
10)drag_layout.Parent=info_drag local function CreateInfoLabel(text,layout_order
)local label=Instance.new('TextLabel')label.Name=Util.RandomName()label.
BackgroundTransparency=1 label.BorderSizePixel=0 label.LayoutOrder=layout_order
label.AutomaticSize=Enum.AutomaticSize.X label.Size=UDim2.new(0,0,1,0)label.Text
=text label.TextSize=16 label.TextTransparency=0 label.Parent=info_drag self:
RegisterThemeObject(label,'FontFace','FontRegular')self:RegisterThemeObject(
label,'TextColor3','Text')return label end local function CreateSeparator(
layout_order)local sep=Instance.new('Frame')sep.Name=Util.RandomName()sep.
LayoutOrder=layout_order sep.BackgroundTransparency=0.35 sep.BorderSizePixel=0
sep.Size=UDim2.new(0,1,0,16)sep.Parent=info_drag self:RegisterThemeObject(sep,
'BackgroundColor3','Text')return sep end local script_name=CreateInfoLabel(
'aetherea.lol',1)self:RegisterThemeObject(script_name,'FontFace','FontSemiBold')
local name_gradient=Instance.new('UIGradient')name_gradient.Name=Util.
RandomName()name_gradient.Parent=script_name self:RegisterThemeObject(
name_gradient,'Color','TabTextSelected')CreateSeparator(2)local fps_label=
CreateInfoLabel('0 fps',3)local ping_label=CreateInfoLabel('0 ms',4)
CreateSeparator(5)local time_label=CreateInfoLabel('00:00:00',6)local date_label
=CreateInfoLabel('Jan, 1st, 9999',7)MakeDraggable(main,topbar,function()self:
_QueueAutoSave()end)MakeDraggable(info_bar,info_drag,function()self:
_QueueAutoSave()end)local kMonthNames={'Jan','Feb','Mar','Apr','May','Jun','Jul'
,'Aug','Sep','Oct','Nov','Dec'}local function GetOrdinalSuffix(day)if day>=11
and day<=13 then return'th'end local d=day%10 if d==1 then return'st'elseif d==2
then return'nd'elseif d==3 then return'rd'else return'th'end end local function
FormatDate()local t=os.date('*t')return string.format('%s, %d%s, %d',kMonthNames
[t.month],t.day,GetOrdinalSuffix(t.day),t.year)end local smoothed_fps=60 local
time_accum=0 RunService.Heartbeat:Connect(function(dt)local raw_fps=1/math.max(
dt,1e-4)smoothed_fps+=(raw_fps-smoothed_fps)*math.min(dt*6,1)local t=os.clock()
name_gradient.Offset=Vector2.new(math.sin(t*0.8),0)time_accum+=dt if time_accum
>=0.2 then time_accum=0 fps_label.Text=string.format('%d fps',math.round(
smoothed_fps))local ping_ok,ping_value=pcall(function()return GetService(
'Players').LocalPlayer:GetNetworkPing()*1000 end)ping_label.Text=string.format(
'%d ms',ping_ok and math.round(ping_value)or 0)time_label.Text=os.date(
'%H:%M:%S')date_label.Text=FormatDate()end end)box.Focused:Connect(function()
Util.Tween(border,kTweenSlow,{Color=self.theme.InputStrokeSelected})end)box.
FocusLost:Connect(function()Util.Tween(border,kTweenSlow,{Color=self.theme.
InputStroke})end)box:GetPropertyChangedSignal('Text'):Connect(function()local
query=string.lower(box.Text)if query==''then for _,tab in pairs(self.tabs)do for
_,section in pairs(tab.sections)do section.frame.Visible=true end end return end
local matched_sections={}local matched_tab=nil if self.controls[query]then local
entry=self.controls[query]matched_sections[entry.section]=true matched_tab=entry
.tab else for key,entry in pairs(self.controls)do if string.find(key,query,1,
true)then matched_sections[entry.section]=true matched_tab=matched_tab or entry.
tab end end end if not matched_tab then for _,tab in pairs(self.tabs)do for _,
section in pairs(tab.sections)do section.frame.Visible=false end end return end
self:SwitchTab(matched_tab.name,matched_tab.description)for _,section in pairs(
matched_tab.sections)do section.frame.Visible=matched_sections[section]==true
end end)clear_btn.MouseButton1Click:Connect(function()box.Text=''end)return self
end function Window:CreateTab(name,description,icon)if not self.tab_list then
return end description=description or'No Description'local tab=Tab.New(name,
description,self.tab_list,self,self.flags)tab.icon.Image=Assets.Get(icon)self.
tabs[name]=tab self.tab_order[#self.tab_order+1]=name if not self.active_tab
then self:SwitchTab(name,description)end return tab end function Window:
SwitchTab(name,desc)local tab=self.tabs[name]local prev if not tab then return
end if self.switching then return end if self.active_tab==name then return end
self.switching=true if self.active_tab then prev=self.tabs[self.active_tab]if
prev and prev.button then Util.Tween(prev.button,kTweenSlow,{
BackgroundTransparency=1})Util.Tween(prev.corner_radius,kTweenSlow,{CornerRadius
=UDim.new(1,0)})Util.Tween(prev.border,kTweenSlow,{Transparency=1})SequenceTween
.new(prev.gradient,'Color',self.theme.TabText,kTweenSlow):Play()SequenceTween.
new(prev.gradient,'Transparency',NumberSequence.new(0.5),kTweenSlow):Play()end
end if tab.button then Util.Tween(tab.button,kTweenSlow,{BackgroundTransparency=
0.5})Util.Tween(tab.corner_radius,kTweenSlow,{CornerRadius=UDim.new(0,8)})Util.
Tween(tab.border,kTweenSlow,{Transparency=0})SequenceTween.new(tab.gradient,
'Color',self.theme.TabTextSelected,kTweenSlow):Play()SequenceTween.new(tab.
gradient,'Transparency',NumberSequence.new(0),kTweenSlow):Play()end local
transition=TweenService:Create(self.tab_content,kTweenFast,{GroupTransparency=1}
)transition:Play()task.delay(kTweenFast.Time,function()if prev and prev.
left_container and prev.right_container then prev.left_container.Visible=false
prev.right_container.Visible=false end tab.left_container.Visible=true tab.
right_container.Visible=true end)transition=TweenService:Create(self.tab_content
,kTweenFast,{GroupTransparency=0})transition:Play()self.active_tab=name self.
task_title.Text=name self.task_description.Text=desc self.switching=false end
function Window:HideAll()self:Hide()self:HideKeybindWindow()self:HideWatermark()
end function Window:ShowAll()self:Show()self:ShowKeybindWindow()self:
ShowWatermark()end function Window:_StartCursorEnforcement()if self.
_cursor_enforce_conn then return end self._cursor_enforce_conn=RunService.
RenderStepped:Connect(function()if UserInputService.MouseIconEnabled~=true then
UserInputService.MouseIconEnabled=true end if UserInputService.MouseIcon~=
[[rbxasset://textures/Cursors/KeyboardMouse/ArrowFarCursor.png]]then
UserInputService.MouseIcon=
[[rbxasset://textures/Cursors/KeyboardMouse/ArrowFarCursor.png]]end end)end
function Window:_StopCursorEnforcement()if self._cursor_enforce_conn then self.
_cursor_enforce_conn:Disconnect()self._cursor_enforce_conn=nil end end function
Window:Hide()self.open=false self:_StopCursorEnforcement()Util.Tween(self.border
,kTweenMid,{Transparency=1})local hide_tween=TweenService:Create(self.main,
kTweenMid,{GroupTransparency=1})hide_tween:Play()task.delay(kTweenMid.Time,
function()self.main.Visible=false end)UserInputService.MouseIcon=self.
_original_mouse_icon UserInputService.MouseIconEnabled=self.
_original_mouse_icon_enabled end function Window:Show()self._original_mouse_icon
=UserInputService.MouseIcon self._original_mouse_icon_enabled=UserInputService.
MouseIconEnabled self.main.Visible=true self:_StartCursorEnforcement()Util.
Tween(self.border,kTweenMid,{Transparency=0})local show_tween=TweenService:
Create(self.main,kTweenMid,{GroupTransparency=0})show_tween:Play()self.open=true
end function Window:HideKeybindWindow()self.keybinds_window:Hide()end function
Window:ShowKeybindWindow()self.keybinds_window:Show()end function Window:
HideWatermark()Util.Tween(self.info_bar_border,kTweenMid,{Transparency=1})local
hide_tween=TweenService:Create(self.info_bar,kTweenMid,{GroupTransparency=1})
hide_tween:Play()task.delay(kTweenMid.Time,function()self.info_bar.Visible=false
end)end function Window:ShowWatermark()self.info_bar.Visible=true Util.Tween(
self.info_bar_border,kTweenMid,{Transparency=0})local show_tween=TweenService:
Create(self.info_bar,kTweenMid,{GroupTransparency=0})show_tween:Play()end
function Window:ToggleVisibility()if self.open then self:Hide()else self:Show()
end end function Window:Notify(data)if not self.notif_manager then return end
self.notif_manager:Push(data)end function Window:RegisterThemeObject(obj,
property,key)table.insert(self._theme_objects,{Object=obj,Property=property,Key=
key})obj[property]=self.theme[key]end function Window:SetTheme(name)self.theme=
Theme.Load(name)for _,item in ipairs(self._theme_objects)do item.Object[item.
Property]=self.theme[item.Key]end end function Window:_GetConfigTarget()if not
self.config.ConfigFolder or not self.config.ConfigFile then return nil,nil end
return self.config.ConfigFolder,self.config.ConfigFile end function Window:
_CapturePositions()if self.config.SaveWindowPosition==false then return nil end
local positions={}if self.main then positions.Window=Util.UDim2ToTable(self.main
.Position)end if self.info_bar then positions.InfoBar=Util.UDim2ToTable(self.
info_bar.Position)end if self.keybinds_window and self.keybinds_window.frame
then positions.Keybinds=Util.UDim2ToTable(self.keybinds_window.frame.Position)
end return positions end function Window:_ApplyPositions(positions)if not
positions or self.config.SaveWindowPosition==false then return end if positions.
Window and self.main then local udim=Util.TableToUDim2(positions.Window)if udim
then self.main.Position=udim end end if positions.InfoBar and self.info_bar then
local udim=Util.TableToUDim2(positions.InfoBar)if udim then self.info_bar.
Position=udim end end if positions.Keybinds and self.keybinds_window and self.
keybinds_window.frame then local udim=Util.TableToUDim2(positions.Keybinds)if
udim then self.keybinds_window.frame.Position=udim end end end function Window:
SaveConfig()local folder,filename=self:_GetConfigTarget()if not folder then
return end Config.Save(self.flags,folder,filename,self:_CapturePositions(),self.
theme_name)end function Window:LoadConfig()local folder,filename=self:
_GetConfigTarget()if not folder then return end local positions,theme=Config.
Load(self.flags,folder,filename)self:_ApplyPositions(positions)self:SetTheme(
theme)end function Window:ListConfigs(only_valid)local folder=self:
_GetConfigTarget()if not folder then return{}end local names=Config.ListFiles(
folder)if only_valid==false then return names end local valid={}for _,name in
ipairs(names)do if Config.IsValid(folder,name,self.flags)then valid[#valid+1]=
name end end return valid end function Window:GetActiveConfigName()return self.
config.ConfigFile end function Window:LoadConfigByName(filename)local folder=
self:_GetConfigTarget()if not folder then return false end if not Config.
IsValid(folder,filename,self.flags)then return false end self.config.ConfigFile=
filename local positions=Config.Load(self.flags,folder,filename)self:
_ApplyPositions(positions)return true end function Window:SaveConfigAs(filename)
local folder=self:_GetConfigTarget()if not folder then return false end self.
config.ConfigFile=filename self:SaveConfig()return true end function Window:
DeleteConfig(filename)local folder=self:_GetConfigTarget()if not folder then
return false end if filename==self.config.ConfigFile then return false end
return Config.Delete(folder,filename)end function Window:_QueueAutoSave()if self
.config.AutoSaveConfig==false then return end local folder,_=self:
_GetConfigTarget()if not folder then return end self._autosave_dirty=true if
self._autosave_debounce then return end self._autosave_debounce=true task.delay(
0.5,function()self._autosave_debounce=false if self._autosave_dirty then self.
_autosave_dirty=false self:SaveConfig()end end)end function Window:
CreateConfigFlag(flag,getter,setter)local control={Name=flag,Type='Custom',Get=
getter}function control:Set(value,loading)local current=getter()if type(current)
=='table'and type(value)=='table'then table.clear(current)for k,v in pairs(value
)do current[k]=v end else setter(value)end if not loading and self.window_ref
then self.window_ref:_QueueAutoSave()end end control.window_ref=self self.flags[
flag]=control local loaded=self._loaded_config if loaded and loaded[flag]~=nil
then control:Set(loaded[flag],true)end return control end function Window:
Destroy()if self._autosave_dirty then self:SaveConfig()end for _,c in ipairs(
self.connections)do c:Disconnect()end self.screen_gui:Destroy()end function
Window:SetSilentLoad(value)if not(writefile and delfile and makefolder)then
return false end local folder,_=self:_GetConfigTarget()if not folder then return
end folder=kBaseFolderName..folder local path=folder..'/SILENT_LOAD'Util.
SafeCall(makefolder,folder)if value then Util.SafeCall(writefile,path,'')else if
isfile and isfile(path)then Util.SafeCall(delfile,path)end end return true end
function Window:IsSilentLoadEnabled()if not isfile then return false end local
folder,_=self:_GetConfigTarget()if not folder then return end folder=
kBaseFolderName..folder return isfile(folder..'/SILENT_LOAD')end function Config
.Save(flags,folder,filename,positions,theme)if not(writefile and makefolder)then
return end local data={}for flag_name,control in pairs(flags)do if control.Type
=='ColorPicker'then local c=control.Color data[flag_name]={R=math.round(c.R*255)
,G=math.round(c.G*255),B=math.round(c.B*255)}elseif control.Type=='Toggle'then
data[flag_name]=control.CurrentValue elseif control.Type=='Slider'then data[
flag_name]=control.CurrentValue elseif control.Type=='Dropdown'then data[
flag_name]=control.CurrentOption elseif control.Type=='Keybind'then data[
flag_name]={Key=control.CurrentKeybind,Mode=control.Hold and'Hold'or'Toggle',
Pressed=control.Pressed}elseif control.Type=='Input'then data[flag_name]=control
.CurrentValue elseif control.Type=='MultiLineInput'then data[flag_name]=control.
CurrentValue elseif control.Type=='Checklist'then data[flag_name]=control.State
elseif control.Type=='RadioGroup'then data[flag_name]=control.CurrentOption
elseif control.Type=='ProgressBar'then data[flag_name]=control.Value elseif
control.Type=='Custom'then data[flag_name]=control.Get()end end if positions
then data.__Positions=positions end if theme then data.__Theme=theme end local
ok,encoded=pcall(HttpService.JSONEncode,HttpService,data)if not ok then return
end EnsureFolder(kBaseFolderName..folder)Util.SafeCall(writefile,kBaseFolderName
..folder..'/'..filename..kConfigExt,encoded)end function Config.ReadRaw(folder,
filename)if not(isfile and readfile)then return nil end local path=
kBaseFolderName..folder..'/'..filename..kConfigExt if not isfile(path)then
return nil end local ok,data=pcall(HttpService.JSONDecode,HttpService,readfile(
path))if not ok or type(data)~='table'then return nil end return data end
function Config.ListFiles(folder)local dir=kBaseFolderName..folder if not(
isfolder and listfiles)then return{}end if not isfolder(dir)then return{}end
local names={}for _,path in ipairs(listfiles(dir))do if path:sub(-#kConfigExt)==
kConfigExt then local file_name=path:match('[^/\\]+$')if file_name then names[#
names+1]=file_name:sub(1,-(#kConfigExt+1))end end end table.sort(names,function(
a,b)return a:lower()<b:lower()end)return names end function Config.IsValid(
folder,filename,flags)local data=Config.ReadRaw(folder,filename)if not data then
return false end if flags then for flag_name in pairs(data)do if flag_name~=
'__Positions'and flags[flag_name]~=nil then return true end end return false end
return true end function Config.Delete(folder,filename)if not(isfile and delfile
)then return false end local path=kBaseFolderName..folder..'/'..filename..
kConfigExt if not isfile(path)then return false end return Util.SafeCall(delfile
,path)end function Config.ApplyValue(ctrl,value)if not ctrl or value==nil then
return end if ctrl.Type=='ColorPicker'then if type(value)=='table'and value.R
and value.G and value.B then ctrl:Set(Color3.fromRGB(value.R,value.G,value.B))
end elseif ctrl.Type=='Checklist'then if type(value)=='table'then for opt,v in
pairs(value)do ctrl:Set(opt,v)end end elseif ctrl.Type=='Keybind'then if type(
value)=='table'then ctrl:Set(value.Key or'Not Set')ctrl:SetMode(value.Mode or
'Toggle')ctrl:SetPressed(value.Pressed or false)end else ctrl:Set(value)end end
function Config.Load(flags,folder,filename)local data=Config.ReadRaw(folder,
filename)if not data then return nil end local positions=data.__Positions data.
__Positions=nil local theme=data.__Theme data.__Theme=nil for flag_name,value in
pairs(data)do Config.ApplyValue(flags[flag_name],value)end return positions,
theme end function Theme.Save(name,theme)if not(writefile and makefolder)then
return false end if not name or name==''then return false end local data={}for k
,v in pairs(theme or{})do data[k]=Util.SerializeThemeValue(v)end local ok,
encoded=pcall(HttpService.JSONEncode,HttpService,data)if not ok then return
false end EnsureFolder(kBaseFolderName..'/'..kThemeFolder)return Util.SafeCall(
writefile,kBaseFolderName..'/'..kThemeFolder..'/'..name..kConfigExt,encoded)end
function Theme.ReadRaw(name)if not(isfile and readfile)or not name or name==''
then return nil end local path=kBaseFolderName..'/'..kThemeFolder..'/'..name..
kConfigExt if not isfile(path)then return nil end local ok,data=pcall(
HttpService.JSONDecode,HttpService,readfile(path))if not ok or type(data)~=
'table'then return nil end return data end function Theme.ListFiles()local dir=
kBaseFolderName..'/'..kThemeFolder if not(isfolder and listfiles)then return{}
end if not isfolder(dir)then return{}end local names={}for _,path in ipairs(
listfiles(dir))do if path:sub(-#kConfigExt)==kConfigExt then local file_name=
path:match('[^/\\]+$')if file_name then names[#names+1]=file_name:sub(1,-(#
kConfigExt+1))end end end table.sort(names,function(a,b)return a:lower()<b:
lower()end)return names end function Theme.Load(name)local raw=Theme.ReadRaw(
name)local loaded={}if raw then for k,v in pairs(raw)do local deserialized=Util.
DeserializeThemeValue(v)if deserialized~=nil then loaded[k]=deserialized end end
end return Util.Merge(kDefaultTheme,loaded)end function Theme.EnsureDefault()if
not(isfile and writefile and makefolder)then return end local path=
kBaseFolderName..'/'..kThemeFolder..'/default'..kConfigExt if not isfile(path)
then Theme.Save('default',kDefaultTheme)end end local AethereaUI={Version=nil,
Flags={}}function AethereaUI:CreateWindow(config)if not config.Title or not
config.Version then return end self.Version=config.Version Theme.EnsureDefault()
local base_theme=kDefaultTheme if config.ThemeName then base_theme=Theme.Load(
config.ThemeName)end local theme=Util.Merge(base_theme,config.Theme)if config.
ConfigFolder==nil then local safe_title=tostring(config.Title):gsub('[^%w]','')
if safe_title==''then safe_title='Config'end config.ConfigFolder='/'..safe_title
end if config.ConfigFile==nil then config.ConfigFile='config'end if config.
AutoSaveConfig==nil then config.AutoSaveConfig=true end if config.AutoLoadConfig
==nil then if config.LoadConfigOnLoad~=nil then config.AutoLoadConfig=config.
LoadConfigOnLoad else config.AutoLoadConfig=true end end if config.
SaveWindowPosition==nil then config.SaveWindowPosition=true end for i,file in
ipairs(kLucideIcons)do Assets.Register(i,kLucideURL..file)end Assets.Register(
1000000000,kBaseURL..'/Images/aetherea_logo.png')task.spawn(Assets.Preload)local
window=Window.New(config,theme,self.Flags)window.notif_manager=
NotificationManager.New(window)window.keybinds_window=KeybindsWindow.New(window)
return window end function AethereaUI:SaveConfig(folder,filename)Config.Save(
self.Flags,folder,filename)end function AethereaUI:LoadConfig(folder,filename)
Config.Load(self.Flags,folder,filename)end function AethereaUI:LoadTheme(name)
return Theme.Load(name)end function AethereaUI:ListThemes()return Theme.
ListFiles()end AethereaUI.Config=Config AethereaUI.Theme=Theme AethereaUI.Assets
=Assets AethereaUI.Util=Util return AethereaUI
