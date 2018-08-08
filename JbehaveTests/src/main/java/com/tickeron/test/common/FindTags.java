package com.tickeron.test.common;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

class FindTags {
    public static void main(String[] args) throws IOException {
        long startTime = System.currentTimeMillis();
        Map<Path, List<Element>> result = new HashMap<>();
        Files.walk(Paths.get(args[0]))
            .filter(Files::isRegularFile)
            .filter(p -> p.toString().endsWith(".html"))
            .forEach(p -> {
                String content = null;
                try {
                    content = new String(Files.readAllBytes(p));
                } catch (IOException e) {
                    e.printStackTrace();
                    System.exit(1);
                }
                Document doc = Jsoup.parse(content);
                Elements elements = doc.select("a");
                for (Element element : elements) {
                    // remove all links to application
                    if(element.hasAttr("href") && !element.attr("href").isEmpty() && !element.attr("href").startsWith("javascript:"))
                         continue;

                    if (element.hasAttr("ui-sref")) continue;
                    if (element.hasAttr("ng-href")) continue;

                    if (result.containsKey(p)) result.get(p).add(element);
                    else {
                        List<Element> list = new ArrayList<>();
                        list.add(element);
                        result.put(p, list);
                    }
                }
            });
        result.forEach((k, v) -> {
            System.out.println(String.format("==== File: %s ====", k));
            v.forEach(lv -> System.out.println(String.format("    %s", lv)));
        });
        System.out.println(String.format("Done at %d milliseconds", System.currentTimeMillis() - startTime));
    }
}
