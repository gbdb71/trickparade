local HintText = class("HintText", Entity)

function HintText:initialize(text, intime)
	Entity.initialize(self, 0, 0, -1)

	self.text = text
	self.time = 1.5

	self.texty = -16
	self.font = Resources.getFont("gothic.ttf", 16)

	self.tween = tween.new(0.3, self, {texty = HEIGHT/2-8}, "outBounce")
end

function HintText:update(dt)
	if self.time < 1 then
		self.tween:update(dt)
	end

	self.time = self.time - dt
	if self.time <= 0 then
		self:kill()
	end
end

function HintText:gui()
	love.graphics.setFont(self.font)

	love.graphics.setColor(0, 0, 0)
	for ix=-1, 1 do
		for iy=-1, 1 do
			love.graphics.printf(self.text, ix, self.texty+iy, WIDTH, "center")
		end
	end

	love.graphics.setColor(255, 255, 255)
	love.graphics.printf(self.text, 0, self.texty, WIDTH, "center")
end

return HintText
