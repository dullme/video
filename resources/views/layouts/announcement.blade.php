@if(config('announcement') != 'null')
    <div class="scroll_news" style="vertical-align: middle;padding: 10px 0">
        <marquee scrollamount="3" scrolldelay="0" direction="left" onmouseout="this.start()" onstart="this.firstChild.innerHTML+=this.firstChild.innerHTML;" onmouseover="this.stop()">
            <span class="text-danger">{{ config('announcement') }}</span>
        </marquee>
    </div>
@endif