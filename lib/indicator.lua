local hs = hs
local M = {}

function M.new(label)
  local obj = {
    canvas = nil,
    label = label,
    width = 100,
    height = 25,
  }

  local function computeFrame()
    local screenFrame = hs.screen.mainScreen():frame()

    local x = screenFrame.x + screenFrame.w - obj.width
    local y = screenFrame.y
    local w, h = obj.width, obj.height

    return { x = x, y = y, w = w, h = h }
  end

  function obj:hide()
    if self.canvas then
      self.canvas:delete()
      self.canvas = nil
    end
  end

  function obj:show()
    self:hide()

    self.canvas = hs.canvas.new({ x = 0, y = 0, w = self.width, h = self.height })
    self.canvas:appendElements({
      type = "rectangle",
      action = "fill",
      fillColor = { red = 0.2, green = 0.6, blue = 0.2, alpha = 0.85 },
      roundedRectRadii = { xRadius = 4, yRadius = 4 },
    }, {
      type = "text",
      text = self.label,
      textColor = { white = 1.0 },
      textSize = 12,
      textAlignment = "center",
      frame = { x = 0, y = 3, w = self.width, h = self.height - 5 },
    })

    self.canvas:frame(computeFrame())
    self.canvas:show()
  end

  return obj
end

return M
