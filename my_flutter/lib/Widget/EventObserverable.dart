
typedef void EventCallback(arg);

class EventObserverable {

  // 私有构造函数
  EventObserverable.internal();
  // 单利
  static EventObserverable singleton = new EventObserverable.internal();

  // 工厂构造函数
  factory EventObserverable() => singleton;

  var _observerableMap = new Map<Object, List<EventCallback>>();

  void add(eventName, EventCallback c) {
    if (eventName == null || c == null) return;
    _observerableMap[eventName] ??= new List<EventCallback>();
    _observerableMap[eventName].add(c);
  }

  void remove(eventName, [EventCallback c]) {
    var list = _observerableMap[eventName];
    if (eventName == null || list == null) return;
    if (c == null) {
      _observerableMap[eventName] = null;
    } else {
      list.remove(c);
    }
  }

  void click(eventName, [arg]) {
    var list = _observerableMap[eventName];
    if (list == null) return;
    int ln = list.length - 1;
    //反向遍历，防止在订阅者在回调中移除自身带来的下标错位
    for (var i = ln; i > -1; --i) {
      list[i](arg);
    }
//    list.forEach((f) {
////
////    });

  }

  var obs = new EventObserverable();

}