local function text_cell(text)
    return pandoc.Cell(
        pandoc.Blocks({
            pandoc.Para({ pandoc.Str(text or "") })
        })
    )
end


local function image_cell(path)
    local image = pandoc.Image(
        {},
        path,
        "Signature",
        pandoc.Attr("", {}, {
            { "width", "35mm" }
        })
    )

    return pandoc.Cell(
        pandoc.Blocks({
            pandoc.Para({ image })
        })
    )
end


local function make_row(label, value_cell)
    return pandoc.Row({
        text_cell(label),
        value_cell
    })
end


function Div(div)
    if not div.classes:includes("signature") then
        return nil
    end

    local name  = div.attributes["name"]  or ""
    local title = div.attributes["title"] or ""
    local date  = div.attributes["date"]  or ""
    local image = div.attributes["image"]

    local rows = {
        make_row("Name", text_cell(name)),
        make_row("Title", text_cell(title)),
        make_row(
            "Signature",
            image and image_cell(image) or text_cell("")
        ),
        make_row("Date", text_cell(date))
    }

    local body = pandoc.TableBody(
        rows,
        {},
        0,
        {}
    )

    local colspecs = {
        { pandoc.AlignLeft, 0.25 },
        { pandoc.AlignLeft, 0.75 }
    }

    return pandoc.Table(
        pandoc.Caption(),
        colspecs,
        pandoc.TableHead({}),
        { body },
        pandoc.TableFoot({})
    )
end