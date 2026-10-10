"""Slamming Works mark, attempt 8: the attempt 1 front view tilted counterclockwise, with the attempt 7 wordmark."""
TILT = -5   # degrees; negative = counterclockwise
V,U,N,P,A="#9400D3","#C77DFF","#0E0B14","#F2EFE8","#C6FF3D"
S=f'stroke="{N}" stroke-width="8" stroke-linejoin="round"'
def wheel(x, rim_x):
    out=[f'<rect x="{x}" y="228" width="96" height="184" rx="30" fill="{N}"/>']
    for y in range(250,396,26):
        out.append(f'<polyline points="{x+14},{y+14} {x+48},{y} {x+82},{y+14}" fill="none" stroke="{V}" stroke-width="8" stroke-linecap="round" stroke-linejoin="round"/>')
    out.append(f'<rect x="{rim_x}" y="252" width="16" height="136" rx="7" fill="{P}" {S}/>')
    return "\n".join(out)
rover=f'''<g id="rover" transform="rotate({TILT} 256 260)">
{wheel(62,150)}
{wheel(354,346)}
<!-- motors -->
<rect x="196" y="318" width="56" height="44" rx="10" fill="{P}" {S}/>
<rect x="260" y="318" width="56" height="44" rx="10" fill="{P}" {S}/>
<!-- upper body -->
<polygon points="184,222 328,222 352,262 160,262" fill="{P}" {S}/>
<!-- bumper with headlight tabs -->
<path d="M160 258 H352 V318 H340 V352 H300 V318 H212 V352 H172 V318 H160 Z" fill="{N}" {S}/>
<rect x="180" y="272" width="64" height="28" rx="4" fill="{A}"/>
<rect x="268" y="272" width="64" height="28" rx="4" fill="{A}"/>
<path d="M196 272 V300 M212 272 V300 M228 272 V300 M284 272 V300 M300 272 V300 M316 272 V300" stroke="{N}" stroke-width="3"/>
<circle cx="192" cy="334" r="11" fill="{P}"/>
<circle cx="320" cy="334" r="11" fill="{P}"/>
<!-- camera mount and lidar -->
<rect x="236" y="196" width="40" height="34" fill="{N}"/>
<rect x="196" y="108" width="120" height="74" rx="12" fill="{N}"/>
<rect x="230" y="124" width="52" height="14" rx="7" fill="{V}"/>
<!-- depth camera -->
<rect x="150" y="150" width="212" height="60" rx="30" fill="{P}" {S}/>
<rect x="168" y="162" width="176" height="36" rx="18" fill="{N}"/>
<circle cx="190" cy="180" r="10" fill="{U}"/><circle cx="190" cy="180" r="4" fill="{N}"/>
<circle cx="232" cy="180" r="14" fill="{U}"/><circle cx="232" cy="180" r="6" fill="{N}"/>
<circle cx="296" cy="180" r="10" fill="{U}"/><circle cx="296" cy="180" r="4" fill="{N}"/>
<circle cx="326" cy="180" r="7" fill="{U}"/>
<!-- impact ticks -->
<path d="M40 404 L22 396 M44 386 L24 372 M472 404 L490 396 M468 386 L488 372" stroke="{P}" stroke-width="8" stroke-linecap="round"/>
</g>'''

import glob, os
FONT_SIZE, TRACKING = 132, -2
LINES = (("Slamming", 580, 236), ("Works", 580, 372))
def wordmark(fill):
    """Wordmark as outlined paths from Archivo Black; falls back to live text if fontTools or the font is missing."""
    fonts = glob.glob(os.path.expanduser("~/Library/Fonts/ArchivoBlack-Regular.ttf")) + glob.glob("/Library/Fonts/ArchivoBlack-Regular.ttf")
    try:
        from fontTools.ttLib import TTFont
        from fontTools.pens.svgPathPen import SVGPathPen
        font = TTFont(fonts[0])
    except (ImportError, IndexError):
        print("warning: fontTools or Archivo Black not found, wordmark left as live text")
        spans = "".join(f'<tspan x="{x}" y="{y}">{t}</tspan>' for t, x, y in LINES)
        return f'<text font-family="Archivo Black, sans-serif" font-size="{FONT_SIZE}" fill="{fill}" letter-spacing="{TRACKING}">{spans}</text>'
    gs, cmap, hmtx = font.getGlyphSet(), font.getBestCmap(), font["hmtx"]
    k = FONT_SIZE / font["head"].unitsPerEm
    out = [f'<g fill="{fill}" aria-label="Slamming Works">']
    for text, x, y in LINES:
        for ch in text:
            g = cmap[ord(ch)]
            pen = SVGPathPen(gs)
            gs[g].draw(pen)
            out.append(f'<path transform="translate({x:.2f} {y}) scale({k:.5f} {-k:.5f})" d="{pen.getCommands()}"/>')
            x += hmtx[g][0] * k + TRACKING
    out.append("</g>")
    return "\n".join(out)

bg=f'<path d="M0 0 H448 L512 64 V512 H0 Z" fill="{V}"/>'
def svg(w,h,body,title):
    return f'<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 {w} {h}" width="{w}" height="{h}"><title>{title}</title>\n{body}\n</svg>\n'
open("slw-mark.svg","w").write(svg(512,512,bg+"\n"+rover,"Slamming Works mark"))
lock=f'''<rect width="1400" height="512" fill="{N}"/>
<g>{bg}{rover}</g>
{wordmark(P)}'''
open("slw-lockup.svg","w").write(svg(1400,512,lock,"Slamming Works lockup"))
# light surfaces: violet tile kept, wordmark in Night on Paper
lock_light=lock.replace(f'<rect width="1400" height="512" fill="{N}"/>', f'<rect width="1400" height="512" fill="{P}"/>').replace(f'<g fill="{P}" aria-label', f'<g fill="{N}" aria-label')
open("slw-lockup-light.svg","w").write(svg(1400,512,lock_light,"Slamming Works lockup, light"))
