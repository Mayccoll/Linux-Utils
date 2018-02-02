# Google Tag Manager

## Categories

Category |         Action
:------: | :---------------------:
 Click   |      Click Mobile
         |      Click Slider
         |    Click Destacados
         |    Click Publicidad
         | Click Banner Accesorios
         |   Click Descarga PDF
         |     Click Link Tel
         |     Click Link Waze

 Category   | Action
:---------: | :----:
Permanencia | 30 Seg
            | 45 Seg
            | 60 Seg

--------------------------------------------------------------------------------

## Event Permanencia

### Trigger

- **Name > Timer XX Seg**
- Trigger type > Timer
- Event Name > `gtm.timer`
- Interval > `30000`
- Limit > `1`
- Enable this trigger when >

  - Page URL
  - matches RegEx
  - `.*`

- This trigger fires on > All Timers

### Tag

- **Name > Event Permanencia XX Seg**
- Tag Type > Universal Analytics
- Tracking ID > `{{00 Google Analytics - XXXXX}}`
- Track Type > Event
- Category > `Permanencia`
- Action > `30 seg`
- Label > `30 seg --- {{Page Path}}`
- Value > `{{Page Path}}`
- Triggering >

  - **Timer 30 Seg**

--------------------------------------------------------------------------------

## Event Click Link Tel

### Trigger

- **Name > Click Link Tel**
- Trigger type > Click - Just Links
- Wait for Tags > 2000
- Check Validation
- Enable this trigger when >

  - Click URL
  - matches RegEx
  - `.*`

- Some Link Clicks

- Fire this trigger when >

  - Click URL
  - contains
  - `tel:`

### Tag

- **Name > Event Click Link Tel**
- Tag Type > Universal Analytics
- Tracking ID > `{{00 Google Analytics - XXXXX}}`
- Track Type > Event
- Category > `Click`
- Action > `Click Link Tel`
- Label > `{{Click Text}} --- {{Page Path}}`
- Value > `{{Page Path}}`
- Triggering >

  - **Click Link Tel**

--------------------------------------------------------------------------------

## Event Click Button Class

### Trigger

- **Name > Click Class XXXXXXX**
- Trigger type > Click - All Elements
- This trigger fires on > Some Clicks
- Fire this trigger when >

  - Click Classes
  - contains
  - `CLASS`

### Tag

- **Name > Event Click CLASS**
- Tag Type > Universal Analytics
- Tracking ID > `{{00 Google Analytics - XXXXX}}`
- Track Type > Event
- Category > `Click`
- Action > `Click XXXXXXXXXXX`
- Label > `{{Page Path}} --- {{Click URL}}`
- Value > `{{Page Path}}`
- Triggering >

  - **Click Class**

--------------------------------------------------------------------------------

## Variables

### Page Title

- **Name > 00 - Page Title**
- Variable type > Custom JavaScript

```javascript
function () {
    title = document.title;
    return title;
}
```

### Timestamp

- **Name > Timestamp**
- Variable type > Custom JavaScript

```javascript
Date.prototype.toIsoString = function() {
    var tzo = -this.getTimezoneOffset(),
        dif = tzo >= 0 ? '+' : '-',
        pad = function(num) {
            var norm = Math.floor(Math.abs(num));
            return (norm < 10 ? '0' : '') + norm;
        };
    return this.getFullYear() +
        '-' + pad(this.getMonth() + 1) +
        '-' + pad(this.getDate()) +
        'T' + pad(this.getHours()) +
        ':' + pad(this.getMinutes()) +
        ':' + pad(this.getSeconds()) +
        dif + pad(tzo / 60) +
        ':' + pad(tzo % 60);
}

var dt = new Date();
console.log(dt.toIsoString());
```

--------------------------------------------------------------------------------

## Google Autotrack

- **Name > Google Autotrack**
- Tag Type > Custom HTML

```html
<script>
window.ga=window.ga||function(){(ga.q=ga.q||[]).push(arguments)};ga.l=+new Date;
ga('create', '{{00 Google Analytics - XXXXXX}}', 'auto');

ga('require', 'cleanUrlTracker');
ga('require', 'eventTracker');
ga('require', 'impressionTracker');
ga('require', 'maxScrollTracker');
ga('require', 'mediaQueryTracker');
ga('require', 'outboundFormTracker');
ga('require', 'outboundLinkTracker');
ga('require', 'pageVisibilityTracker');
ga('require', 'socialWidgetTracker');
ga('require', 'urlChangeTracker');

ga('send', 'pageview');
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/autotrack/2.3.2/autotrack.js"></script>
```

- Triggering >

  - **All Pages > page view**

--------------------------------------------------------------------------------
