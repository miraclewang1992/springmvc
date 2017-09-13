var ApplyManager = {

    name: '',

    initChose: function () {
        $('.panel').on('click', function () {
            $('.panel').removeClass('active');
            $(this).addClass('active');
        });
        $('.next').on('click', function () {
            var name = $('.panel.active').data('name');
            if (name) {
                location.href = '/apply/' + name;
            }
        });
        $('.rule').on('click', function () {
            alert('农村电子商务组申报规则：工商登记注册时间在5年（含）以内的创业项目。申报参赛需提交营业执照、税务登记证副本、银行开户许可证复印件等相关文件，产品认定证书等相关证件，涉及国家限制行业和领域的，需有相关资质证明。参赛项目须符合国家农村电子商务产业发展方向，以经营涉农产品及涉农服务项目为主，如农产品销售和配送、农技服务、乡村旅游、农村物流服务等。第一申报人须为企业法人代表，且所占股份不低于30%（含）。');
        });
    },

    initForm: function (name) {
        ApplyManager.name = name;
        $('.next').on('click', function () {
            ApplyManager.nextStep();
        });
        $('.previous').on('click', function () {
            ApplyManager.previousStep();
        });
        $('.types button').on('click', function () {
            $('.types button').removeClass('active');
            $(this).addClass('active');
            var target = $(this).data('target');
            $('.form-grouping .type').hide();
            $('.form-grouping .type.' + target).show();
        });
        $('input[name=industryO]').on('focus', function () {
            $('input[name=industry]').prop('checked', false);
            $('input[value="8"]').prop('checked', true);
        });
        $('input[name=industry]').on('click', function () {
            $('input[name=industryO]').val('');
        });
        $(document).on('click', '#fsUploadProgress .close', function () {
            ApplyManager.deleteAttachment(this);
        });
    },

    selectStep: function (index) {
        if (index == 0) {
            $('.previous').attr('disabled', 'disabled');
        } else {
            $('.previous').removeAttr('disabled');
        }
        if (index == 4) {
            $('.next').html('提交报名信息');
            $('.apply-buttons').append('<p class="text-center" style="color: #d62631;">（点击“提交报名信息”后，方可报名成功）</p>');
        } else {
            $('.apply-buttons p').remove();
            $('.next').html('下一步');
        }
        var step = $('.step')[index];
        $('.step').removeClass('active');
        $(step).addClass('active');
        var name = $(step).data('target');
        $('.section').hide();
        $('.section.' + name).show();
    },

    nextStep: function () {
        var current = $('.step').index($('.step.active'));
        if (current == 0) {
            // 保存第一步的信息
            var data = ApplyManager.checkStepOne();
            if (!data) {
                alert('请填写完整');
                return;
            }
            ApplyManager.saveStepOne(data, ApplyManager.selectStep, current + 1);
            return;
        }
        if (current == 1) {
            // 保存第二步信息
            var data = ApplyManager.checkStepTwo();
            if (!data) {
                alert('请填写完整');
                return;
            }
            ApplyManager.saveStepTwo(data, ApplyManager.selectStep, current + 1);
            return;
        }
        if (current == 2) {
            // 保存第三步信息
            var data = ApplyManager.checkStepThree();
            if (!data) {
                alert('请填写完整');
                return;
            }
            ApplyManager.saveStepThree(data, ApplyManager.selectStep, current + 1);
            return;
        }
        if (current == 3) {
            // 保存swot信息
            var data = ApplyManager.checkStepFour();
            if (!data) {
                alert('请填写完整');
                return;
            }
            ApplyManager.saveStepFour(data, ApplyManager.selectStep, current + 1);
            return;
        }

        if (current == 4) {
            // 最终提交
            if ($('table #fsUploadProgress tr').length == 0) {
                if (!confirm('确认不上传附件？')) {
                    return;
                }
            }
            location.href = '/apply/success';
        }
    },

    previousStep: function () {
        var current = $('.step').index($('.step.active'));
        if (current > 0) {
            ApplyManager.selectStep(current - 1);
        }
    },

    checkStepOne: function () {
        var group = $('#group').val();
        ApplyManager.group = group;
        var province = $('#province').val();
        var city = $('#city').val();
        var projectName = $('#projectName').val();
        var contactName = $('#contactName').val();
        var contactPhone = $('#contactPhone').val();
        if (group == '' || projectName == '' || contactName == '' || contactPhone == '' || city == '') {
            return undefined;
        }
        $('.types').removeClass('on');
        $('.type-' + group).addClass('on');
        return {
            group: group,
            province: province,
            city: city,
            projectName: projectName,
            contactName: contactName,
            contactPhone: contactPhone
        }
    },

    checkStepTwo: function () {
        var t = $('.types.on button.active').data('target');
        if (!t && ApplyManager.group != 6) {
            alert('选择阶段后继续');
            return;
        }
        var type = 0;
        if (t == 'grow') {
            // 成长型
            type = 0;
        } else if (t == 'idea') {
            // 创意型
            type = 1;
        } else if (t == 'new') {
            // 初创
            type = 2;
        }
        if (type == 0 || type == 2) {
            var name = $('#company').val();
            var time = $('#time').val();
            var address = $('#address').val();
            //var inds = ApplyManager.industryName();
            //console.log(inds);
            if (name == '' || time == '' || address == '') {
                return undefined;
            }
            return {
                period: type,
                companyName: name,
                time: time,
                address: address,
                //industryName: inds[0],
                //industry: inds[1]
            };
        }
        var start = $('#startTime').val();
        //var inds = ApplyManager.industryName();
        if (start == '') {
            return undefined;
        }
        return {
            period: type,
            time: start,
            //industryName: inds[0],
            //industry: inds[1]
        }
    },

    checkStepThree: function () {
        var plan = $('#plan').val();
        var highlights = $('#highlights').val();
        var introduction = $('#introduction').val();
        var service_intro = $('#service_introduction').val();
        var ownership = $('#ownership').val();
        var team = $('#team').val();
        var market = $('#market').val();
        if (plan == '' || highlights == '' || service_intro == '' || ownership == '' || team == '' || market == '') {
            return undefined;
        }
        return {
            plan: plan,
            highlights: highlights,
            introduction: introduction,
            service_intro: service_intro,
            ownership: ownership,
            team: team,
            market: market
        }
    },

    checkStepFour: function () {
        var strengths = $('#strengths').val();
        var weaknesses = $('#weaknesses').val();
        var opportunities = $('#opportunities').val();
        var threats = $('#threats').val();
        if (strengths == '' || weaknesses == '' || opportunities == '' || threats == '') {
            return undefined;
        }
        return {
            strengths: strengths,
            weaknesses: weaknesses,
            opportunities: opportunities,
            threats: threats
        }
    },

    checkStepFive: function () {
        var links = $('input[name=link]');
        if (links.length == 0) {
            alert('请上传附件');
            return;
        }
        var ls = '';
        for (var i = 0; i < links.length; i++) {
            var link = $(links[i]).val();
            ls += link + ',';
        }

    },

    industryName: function () {
        var names = ['新能源及节能环保', '新材料及装备制造', '生物技术及医疗', '文化创意及现代服务业', '种养殖', '农产品加工', '农业社会化服务', '互联网'];
        var value = $('input[name=industry]:checked').val();
        var name;
        if (value == '8') {
            name = $('input[name=industryO]').val();
            if (name == '') {
                name = '其他';
            }
            value = 0;
        } else {
            name = names[value - 1];
        }
        if (value == '9') {
            return ['互联网', '9'];
        }
        return [name, value];
    },

    saveStepOne: function (data, callback, parameters) {
        $.ajax({
            type: 'POST',
            url: '/api/form/one',
            data: data,
            success: function (data) {
                if (data.success) {
                    ApplyManager.selectStep(parameters);
                } else {
                    alert(data.error);
                }
            }
        });

    },

    saveStepTwo: function (data, callback, parameters) {
        $.ajax({
            type: 'POST',
            url: '/api/form/two',
            data: data,
            success: function (data) {
                if (data.success) {
                    ApplyManager.selectStep(parameters);
                } else {
                    alert(data.error);
                }
            }
        });

    },

    saveStepThree: function (data, callback, parameters) {
        $.ajax({
            type: 'POST',
            url: '/api/form/three',
            data: data,
            success: function (data) {
                if (data.success) {
                    ApplyManager.selectStep(parameters);
                } else {
                    alert(data.error);
                }
            }
        });

    },
    saveStepFour: function (data, callback, parameters) {
        $.ajax({
            type: 'POST',
            url: '/api/form/four',
            data: data,
            success: function (data) {
                if (data.success) {
                    ApplyManager.selectStep(parameters);
                } else {
                    alert(data.error);
                }
            }
        });

    },

    deleteAttachment: function (e) {
        if (!confirm('确认删除该附件吗？')) {
            return;
        }
        var id = $(e).data('id');
        $.ajax({
            type: 'DELETE',
            url: '/api/attachment/' + id,
            success: function (data) {
                if (data.success) {
                    $(e).parents('tr').remove();
                }
            }
        })

    }
};


var UploadManager = {

    init: function () {
        Qiniu.uploader({
            runtimes: 'html5,flash,html4',
            browse_button: 'pickfiles',
            uptoken_url: '/api/token',
            unique_names: false,
            save_key: false,
            domain: 'http://7xjte4.dl1.z0.glb.clouddn.com/',
            container: 'container',
            max_file_size: '100mb',
            flash_swf_url: 'static/scripts/Moxie.swf',
            max_retries: 3,
            dragdrop: true,
            drop_element: 'container',
            chunk_size: '4mb',
            auto_start: true,
            init: {
                FilesAdded: function (up, files) {
                    $('table').show();
                    $('#success').hide();
                    plupload.each(files, function (file) {
                        var progress = new FileProgress(file, 'fsUploadProgress');
                        progress.setStatus("等待...");
                    });
                },
                BeforeUpload: function (up, file) {
                    new FileProgress(file, 'fsUploadProgress');
                },
                UploadProgress: function (up, file) {
                    var progress = new FileProgress(file, 'fsUploadProgress');
                    var chunk_size = plupload.parseSize(this.getOption('chunk_size'));
                    progress.setProgress(file.percent + "%", up.total.bytesPerSec, chunk_size);
                },
                FileUploaded: function (up, file, info) {
                    var progress = new FileProgress(file, 'fsUploadProgress');
                    progress.setComplete(up, info);
                    UploadManager.saveAttachment(up, file, info);
                },
                Error: function (up, err, errTip) {
                },
                UploadComplete: function () {
                    $('#success').show();
                },
                'Key': function (up, file) {
                    var key = '';
                    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
                    for (var i = 0; i < 20; i++) {
                        key += possible.charAt(Math.floor(Math.random() * possible.length));
                    }
                    return key;
                }
            }
        });
    },

    saveAttachment: function (up, file, info) {
        var domain = up.getOption('domain');
        var res = JSON.parse(info);
        var sourceLink = domain + res.key;
        var name = file.name;
        var size = file.size;
        var type = file.type;
        $.ajax({
            type: 'POST',
            url: '/api/attachment',
            data: {
                link: sourceLink,
                name: name,
                size: size,
                type: type,
                key: res.key
            },
            success: function (data) {
                console.log(data);
                $('#' + file.id + ' .close').attr('data-id', data.id);
            }
        })
    }
};


var AccountManager = {

    sendMail: function () {
        $('#confirm').on('click', function () {
            var email = $('#email').val();
            var _ = $(this);
            _.html('发送中...');
            _.attr('disabled', 'disabled');
            $.ajax({
                type: 'POST',
                url: '/api/mail',
                data: {email: email},
                success: function (data) {
                    console.log(data);
                    if (data.success) {
                        $('.error-tip').html('发送成功，1分钟左右将收到邮件');
                    } else {
                        $('.error-tip').html(data.error);
                        _.removeAttr('disabled');
                        _.html('发送找回邮件');
                    }
                }
            })
        });
    }

};