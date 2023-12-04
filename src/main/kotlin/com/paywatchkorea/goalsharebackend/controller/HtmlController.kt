package com.paywatchkorea.goalsharebackend.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping

@Controller
class HtmlController {
    @GetMapping("/")
    fun defaultPage(): String {
        return "index"
    }
}