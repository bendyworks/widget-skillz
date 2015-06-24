export default function() {
  this.get('/api/widgets', function(){
    return { widgets: [
      {
        id: 1,
        name: "a widget"
      },
      {
        id: 2,
        name: "another widget"
      },
    ]};
  });
}
