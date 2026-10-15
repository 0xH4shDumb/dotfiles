from kitty.fast_data_types import Screen
from kitty.tab_bar import DrawData, ExtraData, TabBarData, as_rgb, draw_title

def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_tab_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    if is_last:
        return screen.cursor.x

    tab_bg = draw_data.active_bg if tab.is_active else draw_data.inactive_bg
    tab_fg = draw_data.active_fg if tab.is_active else draw_data.inactive_fg
    default_bg = as_rgb(int(draw_data.default_bg))

    if tab.is_active:
        left_sep = ""
        right_sep = ""
    else:
        left_sep = " "
        right_sep = " "

    screen.cursor.fg = tab_bg
    screen.cursor.bg = default_bg
    screen.draw(left_sep)

    screen.cursor.bg = tab_bg
    screen.cursor.fg = tab_fg

    if tab.is_active:
        title = f" {index + 1}: {tab.title[:max_tab_length - 5]} "
    else:
        title = f" {index + 1}: {tab.title[:max_tab_length - 5]} "

    screen.draw(title)

    screen.cursor.fg = tab_bg
    screen.cursor.bg = default_bg
    screen.draw(right_sep)

    return screen.cursor.x
