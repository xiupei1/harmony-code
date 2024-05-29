@Component
export struct TableShow {
  @State toggleFlag:boolean = false
  @Prop count:number

  aboutToAppear(): void {
    console.log(String(this.toggleFlag),'toggleFlag...');
  }
  build() {
    Row(){
      Text(`TableShow ${this.count}`)
      // Toggle({type:ToggleType.Checkbox,isOn:this.toggleFlag.valueOf()}).onChange(()=>{
      //
      // })
    }.border({width:1,color:'#333'}).width(200).height(100).onClick(()=>{
      this.count++
    })
  }
}