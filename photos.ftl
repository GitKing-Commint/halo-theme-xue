<#include "module/macro.ftl">
<@layout title="${settings.photos_title!'相册'} | ${options.blog_title!}">
  <main class="mx-auto" id="container">
<#--    <header class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 h-1/2">-->
<#--      <#if settings.photos_patternimg?? && settings.photos_patternimg!=''>-->
<#--        <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">-->
<#--          <img src="${settings.photos_patternimg!}"-->
<#--               class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60 no-zoom"-->
<#--               alt="${settings.photos_title!'相册'}">-->
<#--        </div>-->
<#--      <#else>-->
<#--        <div class="placeholder-bg">-->
<#--        </div>-->
<#--      </#if>-->
<#--      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">-->
<#--        <h2 class="text-white mb-5 mt-4 leading-loose relative w-full text-4xl text-center dark:text-gray-300">-->
<#--          ${settings.photos_title!'相册'}-->
<#--        </h2>-->
<#--      </div>-->
<#--    </header>-->
    
    <header id="hero" class="bg-gray-900 table fade-down relative w-full opacity-95 z-10 <#if settings.enabled_index_cover_height!true>h-1/2 sm:h-1/2 md:h-screen full-screen<#else> h-1/2</#if>">
        <#if settings.photos_patternimg?? && settings.photos_patternimg!=''>
          <div class="cover-bg bottom-0 left-0 right-0 top-0 opacity-30 absolute">

            <video id="video"  autoplay muted loop
                   class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60 no-zoom"
                   playsinline x5-video-player-type="h5">
              <source src="${settings.photos_patternimg!}" poster="${settings.photos_patternimg!}" />
            </video>

            <!-- <video src="${settings.photos_patternimg!}" poster="${settings.photos_patternimg!}"
            webkit-playsinline="true" playsinline="true"  autoplay muted loop
               class="h-full w-full left-0 object-cover absolute top-0 dark:filter-60 no-zoom" /> -->
          </div>
        <#else>
          <div class="placeholder-bg"></div>
        </#if>
      <div class="h-96 align-middle table-cell relative w-full index flex justify-center">
        <!-- 封面内容 -->
        <!-- <h2 class="text-white dark:text-gray-300 mb-5 mt-4 leading-loose relative w-full text-4xl text-center">
          ${settings.home_title!options.blog_title!}
        </h2> -->

        <h2 class="text-white mb-5 mt-4 leading-loose relative w-full text-4xl text-center dark:text-gray-300">
            ${settings.photos_title!'相册'}
        </h2>

        <hr class="text-center bg-red-300 h-0.5 border-none w-20 mx-auto -mt-5 mb-3"/>
        <!-- 
        <p class="slogan text-center text-white dark:text-gray-300 text-lg md:text-xl text-center" id="slogan">${settings.home_description!}</p>
         -->
          <#if settings.enabled_index_cover_height!true>
            <p class="w-full text-4xl absolute bottom-11 text-center">
              <a class="arrow-down z-50 <#if settings.enabled_index_cover_height!true>hidden sm:hidden md:block <#else>hidden</#if>" href="javascript:void(0)">
                <span class="iconfont icon-toBottom text-white dark:text-gray-300"></span>
              </a>
            </p>
          </#if>
      </div>
    </header>
    
    <div
      class="mx-auto px-10 mt-16 tracking-wider md:leading-relaxed sm:leading-normal cn-pd photos-page fade-up">
      <div class="photos-box article-content" id="gallery-content">
        <div id="gallery-filter">
          <ul>
            <li>
              <a href="javascript:void(0);" data-filter="*" class="active text-gray-800 dark:text-gray-300 bg-box-shadow">全部</a>
            </li>
            <@photoTag method="listTeams">
              <#list teams as item>
                <li>
                  <a href="javascript:void(0);"
                     class="text-gray-800 dark:text-gray-300 bg-box-shadow"
                     data-filter=".${((item.team)?length>0)?string((item.team),'无分组')}">${((item.team)?length>0)?string((item.team),'无分组')}</a>
                </li>
              </#list>
            </@photoTag>
          </ul>
        </div>
        <div class="gallery masonry-gallery" id="lightGallery">
            <@photoTag method="list">
                <#list photos?sort_by('name')?reverse as photo>
                  <figure class="gallery-item col-3 ${((photo.team)?length>0)?string((photo.team),'无分组')}" data-src="${photo.url!}">
                    <header class="gallery-icon">
                      <span data-fancybox="gallery" href="${photo.url!}" >
                        <!-- 相册list -->
                        <#if photo.team=="视频">
                          <video id="video"  autoplay muted loop
                                 class="lazyload dark:filter-60"
                                 playsinline x5-video-player-type="h5">
                                <source src="${photo.url!}" poster="${photo.url!}" />
                            </video>
                        <#else>
                          <img class="lazyload dark:filter-60" src="${theme_base!}/source/images/loading.gif" data-src="${photo.url!}"
                               alt="${photo.name!}"/>
                        </#if>
                      </span>
                    <figcaption class="gallery-caption">
                      <div class="entry-summary">
                        <h3>${photo.name}</h3>
                          <#if photo.description?? && photo.description != "">
                            <p>${photo.description!}</p>
                          </#if>
                      </div>
                    </figcaption>
                    <p class="name" style="display: none">${photo.name}</p>
                  </figure>
                </#list>
            </@photoTag>
        </div>
      </div>
    </div>
  </main>
</@layout>
