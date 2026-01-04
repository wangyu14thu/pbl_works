// 数据存储
const userData = {
    nickname: '',
    gender: '',
    grade: '',
    school: '',
    city: '',
    selectedRole: null,
    selectedProject: null,
    projectData: {}
};

// 角色和项目数据（三年级示例）
const rolesData = {
    3: [
        {
            id: 'R001',
            name: '自然守护者',
            icon: '🌿',
            image: '自然守护者.png',
            projectId: 'P301',
            tags: ['深度观察', '绿色设计', '共情行动'],
            description: '守护自然，关怀生命'
        },
        {
            id: 'R002',
            name: '未来工程师',
            icon: '⚙️',
            image: '少年工程师.png',
            projectId: 'P302',
            tags: ['创意思维', '动手实践', '问题解决'],
            description: '用科技改变世界'
        },
        {
            id: 'R003',
            name: '少年CEO',
            icon: '💼',
            image: '少年CEO.png',
            projectId: 'P303',
            tags: ['商业思维', '沟通协调', '创新能力'],
            description: '领导团队，创造价值'
        },
        {
            id: 'R004',
            name: '文化策展人',
            icon: '🎨',
            image: '文化策展人.png',
            projectId: 'P304',
            tags: ['文化传承', '审美鉴赏', '策划能力'],
            description: '发现传统，传播美好'
        },
        {
            id: 'R005',
            name: '游戏策划师',
            icon: '🎮',
            image: '游戏策划师.png',
            projectId: 'P305',
            tags: ['创意设计', '规则制定', '趣味思维'],
            description: '设计快乐，创造欢笑'
        }
    ]
};

const projectsData = {
    'P301': {
        id: 'P301',
        title: '校园流浪猫避风港策划',
        roleId: 'R001',
        roleName: '自然守护者',
        intro: '随着气温下降，校园里的流浪猫难以御寒。作为自然守护者，你的使命是利用环保材料，为它们策划并搭建一个温暖、隐蔽的家。',
        skills: [
            { icon: '🔍', name: '深度观察', desc: '能够敏锐察觉周围环境的变化，发现被忽略的生命需求' },
            { icon: '♻️', name: '绿色设计', desc: '擅长利用环保、废旧材料进行创意改造，减少地球负担' },
            { icon: '❤️', name: '共情行动', desc: '具备强大的同理心，能站在动物的角度思考解决问题' }
        ],
        steps: {
            step1: {
                title: '观察与发现',
                task: '任务：化身小侦探，去校园里寻找流浪猫经常出没的地方。猫咪喜欢待在避风的角落，还是空旷的地方？',
            },
            step2: {
                title: '学习与思考',
                knowledge: '猫咪是恒温动物，但它们害怕潮湿。纸箱虽然保暖，但如果直接接触地面会受潮变软，失去保暖效果。',
                task: '职业任务：请调研并列出 3 种适合做猫窝的防水或保暖材料。'
            },
            step3: {
                title: '行动与创作',
                task: '任务：动手设计你的避风港图纸，并利用废旧材料（如泡沫箱、防雨布）开始制作。记得留一个只有猫咪能进出的小口哦！'
            },
            step4: {
                title: '分享与迭代',
                task: '任务：将制作好的避风港安置在预定地点。恭喜你，守护者！你成功完成了一次生命关怀行动。',
                medal: '初级自然守护者勋章'
            }
        }
    },
    'P302': {
        id: 'P302',
        title: '自动浇花装置发明',
        roleId: 'R002',
        roleName: '未来工程师',
        intro: '教室里的植物总是因为假期无人浇水而枯萎。作为未来工程师，你的任务是设计一个自动浇花装置，让植物在无人照料时也能茁壮成长。',
        skills: [
            { icon: '💡', name: '创意思维', desc: '能够跳出常规思维，提出创新的解决方案' },
            { icon: '🔧', name: '动手实践', desc: '擅长将想法转化为实际的作品和装置' },
            { icon: '🎯', name: '问题解决', desc: '能够分析问题本质，找到最优解决路径' }
        ],
        steps: {
            step1: {
                title: '观察与发现',
                task: '任务：观察教室里的植物，记录它们的位置、大小和浇水需求。思考：植物多久需要浇一次水？每次需要多少水？',
            },
            step2: {
                title: '学习与思考',
                knowledge: '植物需要适量的水分才能健康生长。浇水过多会导致根部腐烂，浇水过少则会干枯。自动浇水装置需要控制好水量和频率。',
                task: '职业任务：研究并列出 3 种可以用来制作自动浇水装置的材料或原理。'
            },
            step3: {
                title: '行动与创作',
                task: '任务：利用简单的材料（如塑料瓶、吸管、海绵等）制作你的自动浇水装置原型。测试它是否能按预期工作！'
            },
            step4: {
                title: '分享与迭代',
                task: '任务：将装置安装在植物旁边，观察效果。恭喜你，工程师！你用科技让生活变得更美好。',
                medal: '初级未来工程师勋章'
            }
        }
    },
    'P303': {
        id: 'P303',
        title: '班级零食交换日',
        roleId: 'R003',
        roleName: '少年CEO',
        intro: '同学们都带了不同的零食，但不是每个人都喜欢自己带的那种。作为少年CEO，你需要策划一个班级零食交换活动，让每个人都能换到自己喜欢的零食。',
        skills: [
            { icon: '💼', name: '商业思维', desc: '理解交换和价值的概念，懂得如何创造双赢' },
            { icon: '🤝', name: '沟通协调', desc: '善于倾听需求，协调不同人的利益' },
            { icon: '✨', name: '创新能力', desc: '能够设计出有趣的规则和玩法' }
        ],
        steps: {
            step1: {
                title: '观察与发现',
                task: '任务：调查同学们都带了什么零食，以及他们想要交换什么零食。记录下供需情况。',
            },
            step2: {
                title: '学习与思考',
                knowledge: '在交换中，双方都觉得自己得到的东西更有价值，这样的交换才是成功的。我们需要制定公平的规则，让每个人都满意。',
                task: '职业任务：设计 3 条交换规则，确保活动公平、有趣。'
            },
            step3: {
                title: '行动与创作',
                task: '任务：制作交换活动的宣传海报和规则说明书，准备好交换所需的记录表格或工具。'
            },
            step4: {
                title: '分享与迭代',
                task: '任务：组织并主持这次交换活动。恭喜你，CEO！你成功创造了一次有价值的交换体验。',
                medal: '初级少年CEO勋章'
            }
        }
    },
    'P304': {
        id: 'P304',
        title: '探寻家乡非遗手艺',
        roleId: 'R004',
        roleName: '文化策展人',
        intro: '家乡有许多传统手艺正在被人们遗忘。作为文化策展人，你的任务是寻找、记录并展示一项家乡的非遗手艺，让更多人了解和喜爱它。',
        skills: [
            { icon: '📜', name: '文化传承', desc: '理解传统文化的价值，愿意传承和保护' },
            { icon: '👁️', name: '审美鉴赏', desc: '能够发现传统工艺中的美和智慧' },
            { icon: '📋', name: '策划能力', desc: '善于组织和展示信息，吸引他人关注' }
        ],
        steps: {
            step1: {
                title: '观察与发现',
                task: '任务：通过询问长辈或上网搜索，找到一项家乡的传统手艺。拍摄或记录下这项手艺的基本信息。',
            },
            step2: {
                title: '学习与思考',
                knowledge: '非物质文化遗产是祖先留给我们的宝贵财富。这些手艺不仅是技术，更承载着历史、文化和情感。',
                task: '职业任务：深入了解这项手艺的历史、制作过程和文化意义。'
            },
            step3: {
                title: '行动与创作',
                task: '任务：制作一份图文并茂的展示海报或PPT，介绍这项非遗手艺。如果可能，可以尝试学习和体验这项手艺。'
            },
            step4: {
                title: '分享与迭代',
                task: '任务：向同学们展示你的调研成果。恭喜你，策展人！你为文化传承贡献了一份力量。',
                medal: '初级文化策展人勋章'
            }
        }
    },
    'P305': {
        id: 'P305',
        title: '课间游戏设计师',
        roleId: 'R005',
        roleName: '游戏策划师',
        intro: '课间十分钟大家总是玩同样的游戏，有点无聊了。作为游戏策划师，你的任务是设计一款适合课间玩的新游戏，让同学们玩得更开心。',
        skills: [
            { icon: '🎨', name: '创意设计', desc: '能够设计出有趣且独特的游戏玩法' },
            { icon: '📏', name: '规则制定', desc: '懂得制定清晰、公平的游戏规则' },
            { icon: '😄', name: '趣味思维', desc: '理解什么是有趣的，如何让人快乐' }
        ],
        steps: {
            step1: {
                title: '观察与发现',
                task: '任务：观察同学们课间都在玩什么游戏，记录下他们喜欢什么，不喜欢什么。',
            },
            step2: {
                title: '学习与思考',
                knowledge: '好的游戏需要简单易懂、公平竞争、适度挑战。课间游戏还需要考虑时间短、人数灵活、安全性高等因素。',
                task: '职业任务：思考并设计一款新游戏的基本玩法和规则。'
            },
            step3: {
                title: '行动与创作',
                task: '任务：详细写下你的游戏规则，画出游戏示意图。如果需要道具，列出道具清单并制作简单的原型。'
            },
            step4: {
                title: '分享与迭代',
                task: '任务：组织同学们试玩你设计的游戏，收集反馈并改进。恭喜你，策划师！你创造了快乐！',
                medal: '初级游戏策划师勋章'
            }
        }
    }
};

// 页面切换函数
function showPage(pageId) {
    document.querySelectorAll('.page').forEach(page => {
        page.classList.remove('active');
    });
    document.getElementById(pageId).classList.add('active');
    window.scrollTo(0, 0);
}

// 初始化注册页面
function initRegisterPage() {
    // 性别选择
    document.querySelectorAll('.gender-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            document.querySelectorAll('.gender-btn').forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            userData.gender = this.dataset.gender;
        });
    });

    // 注册按钮
    document.getElementById('btn-register').addEventListener('click', function() {
        const nickname = document.getElementById('nickname').value.trim();
        const grade = document.getElementById('grade').value;
        const school = document.getElementById('school').value.trim();
        const city = document.getElementById('city').value.trim();

        if (!nickname) {
            alert('请输入昵称');
            return;
        }
        if (!userData.gender) {
            alert('请选择性别');
            return;
        }
        if (!grade) {
            alert('请选择年级');
            return;
        }

        userData.nickname = nickname;
        userData.grade = parseInt(grade);
        userData.school = school;
        userData.city = city;

        loadRoles();
    });
}

// 加载角色页面
function loadRoles() {
    const roles = rolesData[userData.grade];
    
    if (!roles) {
        alert('该年级暂无可选角色，敬请期待！');
        return;
    }

    document.getElementById('welcome-name').textContent = userData.nickname;
    
    const rolesContainer = document.getElementById('roles-container');
    rolesContainer.innerHTML = '';
    
    roles.forEach(role => {
        const roleCard = document.createElement('div');
        roleCard.className = 'role-card';
        
        // 使用图片或图标
        const imageHtml = role.image 
            ? `<div class="role-image-wrapper"><img src="${role.image}" alt="${role.name}" class="role-image" onerror="this.style.display='none'; this.parentElement.innerHTML='<div class=\\'role-icon\\'>${role.icon}</div>';"></div>`
            : `<div class="role-icon">${role.icon}</div>`;
        
        roleCard.innerHTML = `
            <div class="role-title">${role.name}</div>
            ${imageHtml}
            <div class="role-tags">
                ${role.tags.map(tag => `<span class="tag">${tag}</span>`).join('')}
            </div>
        `;
        
        roleCard.addEventListener('click', () => {
            selectRole(role);
        });
        
        rolesContainer.appendChild(roleCard);
    });
    
    showPage('page-roles');
}

// 选择角色
function selectRole(role) {
    userData.selectedRole = role;
    userData.selectedProject = projectsData[role.projectId];
    
    // 显示加载动画
    showPage('page-loading');
    
    // 1.5秒后显示项目详情
    setTimeout(() => {
        loadProjectDetail();
    }, 1500);
}

// 加载项目详情
function loadProjectDetail() {
    const project = userData.selectedProject;
    
    document.getElementById('detail-nickname').textContent = userData.nickname;
    document.getElementById('detail-role').textContent = project.roleName;
    document.getElementById('project-title').textContent = project.title;
    document.getElementById('project-intro').textContent = project.intro;
    
    const skillsList = document.getElementById('skills-list');
    skillsList.innerHTML = '';
    project.skills.forEach(skill => {
        const skillItem = document.createElement('div');
        skillItem.className = 'skill-item';
        skillItem.innerHTML = `
            <div class="skill-icon">${skill.icon}</div>
            <div class="skill-content">
                <h4>${skill.name}</h4>
                <p>${skill.desc}</p>
            </div>
        `;
        skillsList.appendChild(skillItem);
    });
    
    showPage('page-project-detail');
}

// 初始化项目指南
function initGuide() {
    const project = userData.selectedProject;
    
    document.getElementById('guide-title').textContent = project.title;
    
    // 加载步骤内容
    document.getElementById('step1-task').textContent = project.steps.step1.task;
    document.getElementById('step2-knowledge').textContent = project.steps.step2.knowledge;
    document.getElementById('step2-task').textContent = project.steps.step2.task;
    document.getElementById('step3-task').textContent = project.steps.step3.task;
    document.getElementById('step4-task').textContent = project.steps.step4.task;
    
    // 重置进度
    document.querySelectorAll('.progress-step').forEach(step => {
        step.classList.remove('active', 'completed');
    });
    document.querySelector('[data-step="1"]').classList.add('active');
    
    // 显示第一步
    showStep(1);
    showPage('page-guide');
}

// 显示指定步骤
function showStep(stepNum) {
    document.querySelectorAll('.guide-step').forEach(step => {
        step.style.display = 'none';
    });
    document.getElementById(`step-${stepNum}`).style.display = 'block';
    
    // 更新进度条
    document.querySelectorAll('.progress-step').forEach(step => {
        const num = parseInt(step.dataset.step);
        step.classList.remove('active');
        if (num < stepNum) {
            step.classList.add('completed');
        } else if (num === stepNum) {
            step.classList.add('active');
        } else {
            step.classList.remove('completed');
        }
    });
}

// 初始化上传功能
function initUpload(uploadId, fileId, previewId) {
    const uploadArea = document.getElementById(uploadId);
    const fileInput = document.getElementById(fileId);
    const preview = document.getElementById(previewId);
    
    uploadArea.addEventListener('click', () => {
        fileInput.click();
    });
    
    fileInput.addEventListener('change', function() {
        if (this.files && this.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                preview.src = e.target.result;
                preview.style.display = 'block';
                uploadArea.querySelector('.upload-placeholder').style.display = 'none';
            };
            reader.readAsDataURL(this.files[0]);
        }
    });
}

// 显示完成勋章
function showMedalModal() {
    const project = userData.selectedProject;
    const medalTitle = project.steps.step4.medal;
    
    document.getElementById('medal-title').textContent = medalTitle;
    document.getElementById('medal-modal').classList.add('active');
}

// 初始化所有事件监听
function initEventListeners() {
    // 注册页面
    initRegisterPage();
    
    // 返回按钮
    document.getElementById('btn-back-to-register').addEventListener('click', () => {
        showPage('page-register');
    });
    
    document.getElementById('btn-back-to-roles').addEventListener('click', () => {
        showPage('page-roles');
    });
    
    // 开始指南
    document.getElementById('btn-start-guide').addEventListener('click', () => {
        initGuide();
    });
    
    // 步骤导航
    document.getElementById('btn-next-step2').addEventListener('click', () => {
        const image = document.getElementById('preview-step1').src;
        const reason = document.getElementById('textarea-step1').value.trim();
        
        if (!image || image === window.location.href) {
            alert('请上传照片');
            return;
        }
        if (!reason) {
            alert('请填写选择理由');
            return;
        }
        
        userData.projectData.step1_image = image;
        userData.projectData.step1_reason = reason;
        showStep(2);
    });
    
    document.getElementById('btn-back-step1').addEventListener('click', () => {
        showStep(1);
    });
    
    document.getElementById('btn-next-step3').addEventListener('click', () => {
        const materials = [
            document.getElementById('material1').value.trim(),
            document.getElementById('material2').value.trim(),
            document.getElementById('material3').value.trim()
        ];
        
        if (materials.some(m => !m)) {
            alert('请填写全部3种材料');
            return;
        }
        
        userData.projectData.step2_materials = materials;
        showStep(3);
    });
    
    document.getElementById('btn-back-step2').addEventListener('click', () => {
        showStep(2);
    });
    
    document.getElementById('btn-next-step4').addEventListener('click', () => {
        const image = document.getElementById('preview-step3').src;
        
        if (!image || image === window.location.href) {
            alert('请上传设计图或制作照片');
            return;
        }
        
        userData.projectData.step3_image = image;
        showStep(4);
    });
    
    document.getElementById('btn-back-step3').addEventListener('click', () => {
        showStep(3);
    });
    
    document.getElementById('btn-complete').addEventListener('click', () => {
        const thought = document.getElementById('textarea-step4').value.trim();
        
        if (!thought) {
            alert('请写下你想说的话');
            return;
        }
        
        userData.projectData.step4_thought = thought;
        userData.projectData.completed = true;
        
        showMedalModal();
    });
    
    // 关闭勋章弹窗
    document.getElementById('btn-close-modal').addEventListener('click', () => {
        document.getElementById('medal-modal').classList.remove('active');
        showPage('page-roles');
        
        // 重置项目数据
        userData.projectData = {};
    });
    
    // 初始化上传功能
    initUpload('upload-step1', 'file-step1', 'preview-step1');
    initUpload('upload-step3', 'file-step3', 'preview-step3');
}

// 页面加载完成后初始化
document.addEventListener('DOMContentLoaded', function() {
    initEventListeners();
});

