import { Controller } from "@hotwired/stimulus"
import * as Rbase from "./rbase_common.js"

/** gem 等のサブパスから @hotwired/stimulus を直接 import すると esbuild が解決できないため再エクスポートする */
export { Controller }

var currentControllernameValue = null;
var currentActionnameValue = null;

export class RbaseController extends Controller {
  static values = {
    controllername: String,
    actionname: String,
    params: Object,
    callFrom: String
  }
  
  connect() {
    var preview = document.documentElement.hasAttribute("data-turbo-preview");

    //Turboによって、キャッシュロードと実ロードで2回呼ばれるので、キャッシュロード時はスキップする
    console.log("---------------------------");
    console.log("[RbaseController]connected()");
    console.log("[RbaseController]preview:"+preview);

    if (preview) {
      return false;
    }
    console.log("[RbaseController]currentControllernameValue:"+currentControllernameValue);
    console.log("[RbaseController]currentActionnameValue:"+currentActionnameValue);
    
    $('.datepicker').datepicker({
      format: 'yyyy/mm/dd',
      language: 'ja',
      autoclose: true,
      todayHighlight: true
    });
    
    var $this = $(this);
    var self = this;
    var controllername = this.controllernameValue;
    var actionnameValue = this.actionnameValue;
    var defer = new $.Deferred().resolve();

    var param = location.search
    var selfRedirectValue = false;
    if (param.indexOf("self_redirect=true") >= 0) {
      selfRedirectValue = true;
    }

    defer.promise().done(function() {
      if (currentControllernameValue != controllername || currentActionnameValue != actionnameValue || selfRedirectValue) {
        console.log("call:" + controllername + "/" + actionnameValue);
        currentControllernameValue = controllername;
        
        switch(actionnameValue) {
          case "create":
            actionnameValue = "new";
            break;
          case "update":
            actionnameValue = "edit";
            break;
        }
        
        currentActionnameValue = actionnameValue;
        self.callFromValue = "normal";
        $this.trigger(actionnameValue);
      } else {
        console.log("deterrence:" + controllername + "/" + actionnameValue);
        //treeviewの再構築
        $(".treeview").each(function() {
          console.log("treeview:" + $(this).prop("id"));
          self.destroyTreeview($(this));
        })
        $(".treeview").treeview();
      }
    });

    //ターボで更新した場合もイベント呼出を行う。
    $(document).off("turbo:before-fetch-response");
    $(document).on("turbo:before-fetch-response", function(event) {
      console.log("[RbaseController]call turbo:before-fetch-response");
      // 303 追跡後は最終レスポンス（例: 200）のみ届くためヘッダが無いことが多い。無い場合は何もしない。
      var rawHeader = event.detail.fetchResponse.header("X-Flash-Messages");
      if (!rawHeader || rawHeader === "null" || rawHeader === "") {
        return;
      }
      var json;
      try {
        json = JSON.parse(rawHeader);
      } catch (e) {
        console.warn("[RbaseController] X-Flash-Messages JSON parse error", e);
        return;
      }
      var decodeFlashPart = function (encoded) {
        try {
          return decodeURIComponent(String(encoded).replace(/\+/g, " "));
        } catch (e2) {
          return String(encoded);
        }
      };
      var message = "";
      var both = "";
      if (json) {
        if (json["notice"] && json["alert"]) {
          both = "show_alert_both";
        }
        if (json["notice"]) {
          if (!Array.isArray(json["notice"])) {
            json["notice"] = [json["notice"]];
          }
          $.each(json["notice"], function (index, val) {
            var text = decodeFlashPart(val);
            console.log("[RbaseController][notice]" + text);
            message = message + "<div class=\"alert alert-success alert-dismissible fade show " + both + "\" role=\"alert\">" + text;
            message = message + " \
  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\
    <span aria-hidden=\"true\">&times;</span>\
  </button>\
</div>"
          });
        }
        if (json["alert"]) {
          if (!Array.isArray(json["alert"])) {
            json["alert"] = [json["alert"]];
          }
          $.each(json["alert"], function (index, val) {
            var text = decodeFlashPart(val);
            console.log("[RbaseController][alert]" + text);
            message = message + "<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">" + text;
            message = message + " \
  <button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">\
    <span aria-hidden=\"true\">&times;</span>\
  </button>\
</div>"
          });
        }
        if (message != "") {
          $("#entry-turbo-message").html(message);
        }
      }
    });
    
    $(document).off("turbo:before-stream-render");
    console.log("[RbaseController]add turbo:before-stream-render");
    $(document).on("turbo:before-stream-render", function() {
      //同一URLをロードした時にこのイベントが呼ばれる為、clear=trueのパラメータは削除する
      var url = window.location.pathname;
      var params = window.location.search;
      params = params.replace("clear=true", "");

      if (params.length > 1) {
        url = url + params;
      }

      history.replaceState("", "", url);

      currentControllernameValue = controllername;
      switch(actionnameValue) {
        case "create":
          actionnameValue = "new";
          break;
        case "update":
          actionnameValue = "edit";
          break;
      }
      currentActionnameValue = actionnameValue;
      self.callFromValue = "before-stream-render";
      console.log("catch turbo:before-stream-render:"+controllername+"/"+actionnameValue);
      console.log("turbo:before-stream-render call:"+controllername+"/"+actionnameValue);

      $this.trigger(actionnameValue);
    });

    console.log("[RbaseController]add turbo:frame-load");
    $(document).off("turbo:frame-load");
    $(document).on("turbo:frame-load", function() {
      console.log("!!!!!!!!!!!!!!!!turbo:frame-load");
      $(document).trigger("turbo:before-stream-render");
    });
    
    console.log("set tooltip");
    $('[data-toggle="tooltip"]').tooltip({
      trigger: 'click',
      placement: 'top',
      boundary: 'window',
      container: 'body',
      html: true,
      sanitize: false
    });
    
    $(document).on('click.tooltipClose', function (e) {
      if ($(e.target).closest('[data-toggle="tooltip"], .tooltip').length) {
        return;
      }
      var $opened = $('[data-toggle="tooltip"][aria-describedby]');
      if ($opened.length) {
        $opened.tooltip('hide');
      }
    });

    
    $(".selectpicker").selectpicker({
      noneSelectedText: "Please select.",
      liveSearch: true,
      liveSearchPlaceholder: "Search by prefix match.",
      liveSearchStyle: 'startWith'
    });
    $(document).off("change", ".selectpicker");
    $(document).on("change", ".selectpicker", function(event) {
      console.log("change:" + $(event.target).prop("id"));
      $(".selectpicker").selectpicker("refresh");
    })

    $(document).off("changed.bs.select", ".selectpicker");
    $(document).on("changed.bs.select", ".selectpicker", function(event) {
      console.log("changed.bs.select:" + $(event.target).prop("id"));
    })
    
    
    var externalWin = null;
    var NAME = 'external_tab';
    
    //ポップアップは単位とする為の処理
    $(document).off("click.externalLink", "a.external-link");
    $(document).on("click.externalLink", "a.external-link", function(e) {
      if (e.ctrlKey || e.metaKey || e.shiftKey || e.altKey) return;
      // jQuery click eventでは button が未定義のブラウザがあるため which で判定する
      if (e.which && e.which !== 1) return;
      
      e.preventDefault();
      
      var url = $(this).attr("href");
      if (!url) return;
      
      if (!externalWin || externalWin.closed) {
        externalWin = window.open(url, NAME);
        if (!externalWin) {
          // ポップアップブロック時のフォールバック
          window.location.href = url;
        }
        return;
      }
      try {
        externalWin.location.href = url;
        externalWin.focus();
      } catch (_e) {
        externalWin = window.open(url, NAME);
      }
    });

    console.log("[RbaseController]after currentControllernameValue:"+currentControllernameValue);
    console.log("[RbaseController]after currentActionnameValue:"+currentActionnameValue);
    
    if ($("#google_translate_element").length) {
      (async () => {
        await Rbase.loadGoogleTranslate();
        console.log("[RbaseController]after call loadGoogleTranslate");
        new google.translate.TranslateElement({
              pageLanguage: 'ja',
              includedLanguages: 'en,zh-CN',
              layout: google.translate.TranslateElement.InlineLayout.SIMPLE
            }, 'google_translate_element'
        );
      })();
    }
  }
  
  index() {
    console.log("index()");
  }
  
  new() {
    console.log("new()");
  }
  
  create() {
    console.log("create() => new()");
    this.new();
  }
  
  edit() {
    console.log("edit()");
  }

  update() {
    console.log("update() => edit()");
    this.edit();
  }

  show() {
    console.log("show()");
  }
  
  destroyTreeview($tree) {
    $tree.find(".hitarea").remove();
    $tree.find("li").removeClass(
        "collapsable expandable lastCollapsable lastExpandable open closed"
    );
    
    $tree.find("ul").removeAttr("style");
    $tree.off();
  }
}