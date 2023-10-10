/* DESTROY SCRIPT */
DELETE FROM VOTE;
DELETE FROM QUESTION_TAG;
DELETE FROM RELATED_TAGS;
DELETE FROM TAG;
DELETE FROM ANSWER;
DELETE FROM QUESTION;
DELETE FROM CONTENT;
DELETE FROM MEDUSER;

/* USERS */
INSERT INTO MEDUSER (USERNAME, CREATED) VALUES
    ('jkutkut', '2023-10-05'),
    ('jane_doe', '2023-10-06'),
    ('john_smith', '2023-10-06'),
    ('samuel_white', '2023-10-07'),
    ('jennifer_clark', '2023-10-07'),
    ('daniel_lee', '2023-10-07'),
    ('michael_brown', '2023-10-08'),
    ('elizabeth_turner', '2023-10-08'),
    ('sophia_hall', '2023-10-08'),
    ('sarah_clark', '2023-10-08'),
    ('oliver_adams', '2023-10-09'),
    ('natalie_smith', '2023-10-09'),
    ('william_miller', '2023-10-09'),
    ('sophia_davis', '2023-10-09'),
    ('thomas_johnson', '2023-10-10'),
    ('grace_martin', '2023-10-10'),
    ('richard_adams', '2023-10-10'),
    ('robert_harris', '2023-10-10'),
    ('anna_miller', '2023-10-11'),
    ('david_brown', '2023-10-11'),
    ('michael_wilson', '2023-10-11'),
    ('emily_turner', '2023-10-11');

/* TAGS */
INSERT INTO TAG (NAME, DESCRIPTION) VALUES
    ('Cardiology', 'Deals with heart-related disorders and diseases'),
    ('Orthopedics', 'Focuses on musculoskeletal system and bone disorders'),
    ('Dermatology', 'Specializes in skin-related conditions and diseases'),
    ('Gastroenterology', 'Concerned with digestive system disorders'),
    ('Neurology', 'Treats disorders of the nervous system'),
    ('Ophthalmology', 'Deals with eye diseases and vision problems'),
    ('Obstetrics', 'Focuses on pregnancy and childbirth'),
    ('Oncology', 'Specializes in the treatment of cancer'),
    ('Pediatrics', 'Focuses on medical care for children'),
    ('Urology', 'Deals with urinary tract and male reproductive system disorders'),
    ('Psychiatry', 'Treats mental health disorders'),
    ('Rheumatology', 'Specializes in autoimmune and musculoskeletal disorders'),
    ('Endocrinology', 'Focuses on hormone-related disorders'),
    ('Pulmonology', 'Deals with respiratory system disorders'),
    ('Nephrology', 'Concerned with kidney diseases and disorders');

/* QUESTIONS */
-- Cardiology
SELECT
    NEW_QUESTION(
        'How to Maintain a Healthy Heart',
        'I was wondering if anyone had any tips for maintaining a healthy heart. I''m in my 40s and I''m starting to worry about my heart health. I''ve heard that diet and exercise are important, but I''m not sure where to start. Any advice would be appreciated!',
        'john_smith',
        'Cardiology'
    ),
    NEW_QUESTION(
        'Understanding Heart Palpitations',
        'I''ve been experiencing heart palpitations lately and I''m not sure what to do. I''ve been under a lot of stress lately, so I''m wondering if that could be the cause. I''ve also been drinking a lot of coffee, so maybe that''s the problem. Any advice would be appreciated!',
        'sarah_clark',
        'Cardiology'
    ),
    NEW_QUESTION(
        'Diet Tips for Cardiac Health',
        'I''m looking for some diet tips to improve my cardiac health. I''ve been eating a lot of junk food lately and I''m worried about my heart health. I''ve heard that eating more fruits and vegetables can help, but I''m not sure where to start. Any advice would be appreciated!',
        'richard_adams',
        'Cardiology'
    ),
    NEW_QUESTION(
        'Dealing with High Blood Pressure',
        'I''ve been diagnosed with high blood pressure and I''m not sure what to do. I''ve been taking medication for it, but I''m not sure if it''s working. I''ve also been trying to eat healthier and exercise more, but I''m not sure if that''s helping either. Any advice would be appreciated!',
        'anna_miller',
        'Cardiology'
    ),
    NEW_QUESTION(
        'Cardiac Rehabilitation Programs',
        'I''m looking for some information on cardiac rehabilitation programs. I''ve been diagnosed with heart disease and I''m not sure what to do. I''ve heard that cardiac rehab can help, but I''m not sure where to start. Any advice would be appreciated!',
        'emily_turner',
        'Cardiology'
    );

-- Orthopedics
SELECT
    NEW_QUESTION(
        'Common Causes of Joint Pain',
        'I''ve been experiencing joint pain lately and I''m not sure what to do. I''ve been under a lot of stress lately, so I''m wondering if that could be the cause. I''ve also been exercising a lot, so maybe that''s the problem. Any advice would be appreciated!',
        'david_brown',
        'Orthopedics'
    ),
    NEW_QUESTION(
        'Recovery After Knee Surgery',
        'I''m recovering from knee surgery and I''m not sure what to do. I''ve been doing physical therapy, but I''m not sure if it''s helping. I''ve also been taking pain medication, but I''m not sure if that''s helping either. Any advice would be appreciated!',
        'anna_miller',
        'Orthopedics'
    ),
    NEW_QUESTION(
        'Treatment Options for Osteoarthritis',
        'I''m looking for some treatment options for osteoarthritis. I''ve been diagnosed with it and I''m not sure what to do. I''ve heard that physical therapy can help, but I''m not sure where to start. Any advice would be appreciated!',
        'robert_harris',
        'Orthopedics'
    ),
    NEW_QUESTION(
        'Preventing Sports-Related Injuries',
        'I''m looking for some tips on preventing sports-related injuries. I''ve been playing a lot of sports lately and I''m worried about getting injured. I''ve heard that stretching can help, but I''m not sure where to start. Any advice would be appreciated!',
        'grace_martin',
        'Orthopedics'
    ),
    NEW_QUESTION(
        'Physical Therapy for Orthopedic Conditions',
        'I''m looking for some information on physical therapy for orthopedic conditions. I''ve been diagnosed with a knee injury and I''m not sure what to do. I''ve heard that physical therapy can help, but I''m not sure where to start. Any advice would be appreciated!',
        'samuel_white',
        'Orthopedics'
    );

-- Dermatology
SELECT
    NEW_QUESTION(
        'Skincare Tips for Acne-Prone Skin',
        'I''m looking for some skincare tips for acne-prone skin. I''ve been dealing with acne for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!',
        'jennifer_clark',
        'Dermatology'
    ),
    NEW_QUESTION(
        'Managing Eczema Flare-Ups',
        'I''m looking for some tips on managing eczema flare-ups. I''ve been dealing with eczema for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!',
        'elizabeth_turner',
        'Dermatology'
    ),
    NEW_QUESTION(
        'Choosing the Right Sunscreen',
        'I''m looking for some tips on choosing the right sunscreen. I''ve been dealing with sunburns for a while now and I''m not sure what to do. I''ve heard that sunscreen can help, but I''m not sure where to start. Any advice would be appreciated!',
        'daniel_lee',
        'Dermatology'
    ),
    NEW_QUESTION(
        'Common Skin Allergies',
        'I''m looking for some information on common skin allergies. I''ve been dealing with allergies for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!',
        'sophia_hall',
        'Dermatology'
    ),
    NEW_QUESTION(
        'Treating Psoriasis: What Works Best?',
        'I''m looking for some information on treating psoriasis. I''ve been dealing with psoriasis for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!',
        'oliver_adams',
        'Dermatology'
    );

-- Gastroenterology
SELECT
    NEW_QUESTION(
        'Managing Irritable Bowel Syndrome',
        'I''m looking for some tips on managing irritable bowel syndrome. I''ve been dealing with IBS for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!',
        'natalie_smith',
        'Gastroenterology'
    ),
    NEW_QUESTION(
        'Understanding Crohn''s Disease',
        'I''m looking for some information on Crohn''s disease. I''ve been diagnosed with it and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!',
        'thomas_johnson',
        'Gastroenterology'
    ),
    NEW_QUESTION(
        'Healthy Eating for a Happy Gut',
        'I''m looking for some tips on healthy eating for a happy gut. I''ve been dealing with digestive issues for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!',
        'sophia_davis',
        'Gastroenterology'
    ),
    NEW_QUESTION(
        'Liver Health and Its Importance',
        'I''m looking for some information on liver health. I''ve been diagnosed with liver disease and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!',
        'sophia_davis',
        'Gastroenterology'
    ),
    NEW_QUESTION(
        'Colon Cancer Screening Guidelines',
        'I''m looking for some information on colon cancer screening guidelines. I''ve been diagnosed with colon cancer and I''m not sure what to do. I''ve heard that screening can help, but I''m not sure where to start. Any advice would be appreciated!',
        'emily_turner',
        'Gastroenterology'
    );

-- Neurology
SELECT
    NEW_QUESTION(
        'Living with Multiple Sclerosis',
        'I''m looking for some information on living with multiple sclerosis. I''ve been diagnosed with MS and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!',
        'david_brown',
        'Neurology'
    ),
    NEW_QUESTION(
        'Migraine Management Strategies',
        'I''m looking for some information on migraine management strategies. I''ve been dealing with migraines for a while now and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!',
        'anna_miller',
        'Neurology'
    ),
    NEW_QUESTION(
        'Understanding Parkinson''s Disease',
        'I''m looking for some information on Parkinson''s disease. I''ve been diagnosed with it and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!',
        'robert_harris',
        'Neurology'
    ),
    NEW_QUESTION(
        'Epilepsy Treatment Options',
        'I''m looking for some information on epilepsy treatment options. I''ve been diagnosed with epilepsy and I''m not sure what to do. I''ve heard that medication can help, but I''m not sure where to start. Any advice would be appreciated!',
        'grace_martin',
        'Neurology'
    ),
    NEW_QUESTION(
        'Neuropathy and Its Causes',
        'I''m looking for some information on neuropathy. I''ve been diagnosed with it and I''m not sure what to do. I''ve heard that medication can help, but I''m not sure where to start. Any advice would be appreciated!',
        'samuel_white',
        'Neurology'
    );

-- Ophthalmology
SELECT
    NEW_QUESTION(
        'Choosing the Right Eyeglasses',
        'I''m looking for some information on choosing the right eyeglasses. I''ve been diagnosed with nearsightedness and I''m not sure what to do. I''ve heard that glasses can help, but I''m not sure where to start. Any advice would be appreciated!',
        'jennifer_clark',
        'Ophthalmology'
    ),
    NEW_QUESTION(
        'Cataracts: Symptoms and Surgery',
        'I''m looking for some information on cataracts. I''ve been diagnosed with them and I''m not sure what to do. I''ve heard that surgery can help, but I''m not sure where to start. Any advice would be appreciated!',
        'elizabeth_turner',
        'Ophthalmology'
    ),
    NEW_QUESTION(
        'Contact Lens Care Tips',
        'I''m looking for some information on contact lens care tips. I''ve been wearing contacts for a while now and I''m not sure what to do. I''ve heard that cleaning them can help, but I''m not sure where to start. Any advice would be appreciated!',
        'daniel_lee',
        'Ophthalmology'
    ),
    NEW_QUESTION(
        'Glaucoma: Diagnosis and Treatment',
        'I''m looking for some information on glaucoma. I''ve been diagnosed with it and I''m not sure what to do. I''ve heard that medication can help, but I''m not sure where to start. Any advice would be appreciated!',
        'sophia_hall',
        'Ophthalmology'
    ),
    NEW_QUESTION(
        'Refractive Errors and Laser Eye Surgery',
        'I''m looking for some information on refractive errors. I''ve been diagnosed with them and I''m not sure what to do. I''ve heard that laser eye surgery can help, but I''m not sure where to start. Any advice would be appreciated!',
        'oliver_adams',
        'Ophthalmology'
    );

-- Obstetrics
SELECT
    NEW_QUESTION(
        'Prenatal Nutrition for a Healthy Baby',
        'I''m looking for some information on prenatal nutrition. I''m pregnant and I''m not sure what to do. I''ve heard that eating healthy can help, but I''m not sure where to start. Any advice would be appreciated!',
        'natalie_smith',
        'Obstetrics'
    ),
    NEW_QUESTION(
        'Preparing for Childbirth: What to Expect',
        'I''m looking for some information on preparing for childbirth. I''m pregnant and I''m not sure what to do. I''ve heard that taking childbirth classes can help, but I''m not sure where to start. Any advice would be appreciated!',
        'thomas_johnson',
        'Obstetrics'
    ),
    NEW_QUESTION(
        'Postpartum Care Tips for New Moms',
        'I''m looking for some information on postpartum care tips. I''m a new mom and I''m not sure what to do. I''ve heard that eating healthy and exercising can help, but I''m not sure where to start. Any advice would be appreciated!',
        'sophia_davis',
        'Obstetrics'
    ),
    NEW_QUESTION(
        'Choosing a Pediatrician for Your Baby',
        'I''m looking for some information on choosing a pediatrician. I''m a new mom and I''m not sure what to do. I''ve heard that asking friends and family for recommendations can help, but I''m not sure where to start. Any advice would be appreciated!',
        'michael_wilson',
        'Obstetrics'
    ),
    NEW_QUESTION(
        'Breastfeeding: Benefits and Challenges',
        'I''m looking for some information on breastfeeding. I''m a new mom and I''m not sure what to do. I''ve heard that breastfeeding can help with bonding and immunity, but I''m not sure where to start. Any advice would be appreciated!',
        'emily_turner',
        'Obstetrics'
    );

-- Oncology
SELECT
    NEW_QUESTION(
        'Understanding Different Types of Cancer',
        'I''m looking for some information on different types of cancer. I''ve been diagnosed with cancer and I''m not sure what to do. I''ve heard that diet and exercise can help, but I''m not sure where to start. Any advice would be appreciated!',
        'david_brown',
        'Oncology'
    ),
    NEW_QUESTION(
        'Cancer Treatment Options and Side Effects',
        'I''m looking for some information on cancer treatment options. I''ve been diagnosed with cancer and I''m not sure what to do. I''ve heard that chemotherapy can help, but I''m not sure where to start. Any advice would be appreciated!',
        'anna_miller',
        'Oncology'
    ),
    NEW_QUESTION(
        'Coping with a Cancer Diagnosis',
        'I''m looking for some information on coping with a cancer diagnosis. I''ve been diagnosed with cancer and I''m not sure what to do. I''ve heard that talking to friends and family can help, but I''m not sure where to start. Any advice would be appreciated!',
        'robert_harris',
        'Oncology'
    ),
    NEW_QUESTION(
        'Cancer Prevention Strategies',
        'I''m looking for some information on cancer prevention strategies. I''ve been diagnosed with cancer and I''m not sure what to do. I''ve heard that eating healthy and exercising can help, but I''m not sure where to start. Any advice would be appreciated!',
        'grace_martin',
        'Oncology'
    ),
    NEW_QUESTION(
        'Support for Cancer Patients and Their Families',
        'I''m looking for some information on support for cancer patients and their families. I''ve been diagnosed with cancer and I''m not sure what to do. I''ve heard that talking to friends and family can help, but I''m not sure where to start. Any advice would be appreciated!',
        'samuel_white',
        'Oncology'
    );

-- Pediatrics
SELECT
    NEW_QUESTION(
        'Childhood Immunization Schedule',
        'I''m looking for some information on childhood immunization schedules. I''m a new parent and I''m not sure what to do. I''ve heard that talking to my pediatrician can help, but I''m not sure where to start. Any advice would be appreciated!',
        'jennifer_clark',
        'Pediatrics'
    ),
    NEW_QUESTION(
        'Common Childhood Illnesses and Their Treatment',
        'I''m looking for some information on common childhood illnesses. I''m a new parent and I''m not sure what to do. I''ve heard that talking to my pediatrician can help, but I''m not sure where to start. Any advice would be appreciated!',
        'elizabeth_turner',
        'Pediatrics'
    ),
    NEW_QUESTION(
        'Healthy Eating for Kids',
        'I''m looking for some information on healthy eating for kids. I''m a new parent and I''m not sure what to do. I''ve heard that talking to my pediatrician can help, but I''m not sure where to start. Any advice would be appreciated!',
        'daniel_lee',
        'Pediatrics'
    ),
    NEW_QUESTION(
        'Child Safety Tips at Home and School',
        'I''m looking for some information on child safety tips. I''m a new parent and I''m not sure what to do. I''ve heard that talking to my pediatrician can help, but I''m not sure where to start. Any advice would be appreciated!',
        'sophia_hall',
        'Pediatrics'
    ),
    NEW_QUESTION(
        'Adolescent Mental Health Issues',
        'I''m looking for some information on adolescent mental health issues. I''m a new parent and I''m not sure what to do. I''ve heard that talking to my pediatrician can help, but I''m not sure where to start. Any advice would be appreciated!',
        'oliver_adams',
        'Pediatrics'
    );

-- Urology
SELECT
    NEW_QUESTION(
        'Kidney Stones: Causes and Treatment',
        'I''m looking for some information on kidney stones. I''ve been diagnosed with them and I''m not sure what to do. I''ve heard that drinking more water can help, but I''m not sure where to start. Any advice would be appreciated!',
        'natalie_smith',
        'Urology'
    ),
    NEW_QUESTION(
        'Prostate Health: What Men Need to Know',
        'I''m interested in learning more about prostate health and what men need to know about it. Are there any preventative measures or lifestyle changes that can help maintain good prostate health?',
        'natalie_smith',
        'Urology'
    ),
    NEW_QUESTION(
        'Urinary Track Infections in Women',
        'I''m concerned about urinary tract infections (UTIs) in women. Can you provide information on their causes, symptoms, and ways to prevent them?',
        'sophia_davis',
        'Urology'
    ),
    NEW_QUESTION(
        'Incontinence Management for Seniors',
        'I''m a caregiver for an elderly family member who is experiencing incontinence issues. I need guidance on how to effectively manage incontinence for seniors. Any tips or advice would be appreciated.',
        'michael_wilson',
        'Urology'
    ),
    NEW_QUESTION(
        'Bladder Cancer Awareness',
        'I want to raise awareness about bladder cancer. Can you provide information on its risk factors, symptoms, and available treatments?',
        'emily_turner',
        'Urology'
    );

-- Psychiatry
SELECT
    NEW_QUESTION(
        'Understanding Depression and Its Treatment',
        'I''ve been feeling really down lately and suspect I might be dealing with depression. Can you provide information on what depression is, its common signs, and possible treatment options?',
        'david_brown',
        'Psychiatry'
    ),
    NEW_QUESTION(
        'Anxiety Disorders: Signs and Coping Strategies',
        'I''ve been experiencing excessive anxiety and it''s affecting my daily life. Can you share information about anxiety disorders, their signs, and effective coping strategies?',
        'anna_miller',
        'Psychiatry'
    ),
    NEW_QUESTION(
        'Mental Health Stigma: Breaking the Silence',
        'I''m passionate about reducing the stigma surrounding mental health. Can you provide resources and tips on how to break the silence and promote mental health awareness?',
        'robert_harris',
        'Psychiatry'
    ),
    NEW_QUESTION(
        'Counseling and Therapy Options',
        'I''m considering seeking counseling or therapy, but I''m not sure which options are available. Can you explain the different types of counseling and therapy and how to choose the right one for my needs?',
        'grace_martin',
        'Psychiatry'
    ),
    NEW_QUESTION(
        'Medications for Mental Health Conditions',
        'I''ve heard that medications can be helpful for managing certain mental health conditions. Can you provide information on the types of medications used and their potential benefits and side effects?',
        'samuel_white',
        'Psychiatry'
    );

-- Rheumatology
SELECT
    NEW_QUESTION(
        'Living with Rheumatoid Arthritis',
        'I''ve been recently diagnosed with rheumatoid arthritis, and I''m looking for advice on how to live with this condition. Can you provide information on managing symptoms and maintaining a good quality of life?',
        'jennifer_clark',
        'Rheumatology'
    ),
    NEW_QUESTION(
        'Osteoarthritis: Causes and Management',
        'I suspect I might have osteoarthritis, and I''d like to learn more about the causes and how to manage it. Can you provide information on osteoarthritis, its causes, and effective management strategies?',
        'elizabeth_turner',
        'Rheumatology'
    ),
    NEW_QUESTION(
        'Lupus: Symptoms and Treatment',
        'My friend has lupus, and I''d like to understand more about it to support them. Can you explain the symptoms of lupus and the available treatment options for this condition?',
        'daniel_lee',
        'Rheumatology'
    ),
    NEW_QUESTION(
        'Fibromyalgia: Coping with Chronic Pain',
        'I''ve been diagnosed with fibromyalgia and I''m struggling with chronic pain. Can you provide guidance on coping strategies for fibromyalgia and managing the associated pain?',
        'sophia_hall',
        'Rheumatology'
    ),
    NEW_QUESTION(
        'Spondyloarthritis and Its Impact',
        'I''m interested in learning more about spondyloarthritis and its impact on people''s lives. Can you provide information on this condition and how it affects those who have it?',
        'oliver_adams',
        'Rheumatology'
    );

-- Endocrinology
SELECT
    NEW_QUESTION(
        'Thyroid Disorders: Diagnosis and Treatment',
        'I suspect I might have a thyroid disorder, and I''m looking for information on how it''s diagnosed and treated. Can you provide insights into thyroid disorders and their diagnosis and treatment options?',
        'natalie_smith',
        'Endocrinology'
    ),
    NEW_QUESTION(
        'Diabetes Management and Lifestyle',
        'I''ve recently been diagnosed with diabetes and want to learn more about managing it through lifestyle changes. Can you provide guidance on diabetes management and how to adapt my lifestyle to this condition?',
        'thomas_johnson',
        'Endocrinology'
    ),
    NEW_QUESTION(
        'Hormone Replacement Therapy for Menopause',
        'I''m going through menopause and considering hormone replacement therapy. Can you explain what hormone replacement therapy is, its benefits, and potential risks associated with it during menopause?',
        'sophia_davis',
        'Endocrinology'
    ),
    NEW_QUESTION(
        'Adrenal Gland Disorders',
        'I''ve been experiencing symptoms that might be related to adrenal gland disorders. Can you provide information on the various adrenal gland disorders and their management?',
        'michael_wilson',
        'Endocrinology'
    ),
    NEW_QUESTION(
        'Pituitary Disorders: What You Should Know',
        'I''d like to learn more about pituitary disorders and their impact on health. Can you provide information on pituitary disorders and what people should know about them?',
        'emily_turner',
        'Endocrinology'
    );

-- Pulmonology
SELECT
    NEW_QUESTION(
        'Asthma: Symptoms and Inhaler Use',
        'I''ve been recently diagnosed with asthma, and I''m looking for information on its symptoms and how to use inhalers effectively. Can you provide insights into asthma symptoms and the proper use of inhalers?',
        'david_brown',
        'Pulmonology'
    ),
    NEW_QUESTION(
        'COPD: Causes and Breathing Exercises',
        'I have a family member with COPD, and I want to understand the causes and ways to improve their breathing. Can you explain the causes of COPD and provide information on effective breathing exercises for COPD patients?',
        'anna_miller',
        'Pulmonology'
    ),
    NEW_QUESTION(
        'Lung Cancer Screening and Prevention',
        'I''m concerned about lung cancer and would like to know more about screening and prevention measures. Can you provide information on lung cancer screening and effective ways to prevent this disease?',
        'robert_harris',
        'Pulmonology'
    ),
    NEW_QUESTION(
        'Sleep Apnea: Diagnosis and CPAP Therapy',
        'I suspect I might have sleep apnea, and I''m looking for information on diagnosis and CPAP therapy. Can you explain how sleep apnea is diagnosed and the use of CPAP therapy to manage it?',
        'grace_martin',
        'Pulmonology'
    ),
    NEW_QUESTION(
        'Managing Allergies and Respiratory Conditions',
        'I suffer from allergies and respiratory conditions that worsen during certain seasons. Can you provide guidance on managing allergies and these respiratory conditions, especially during peak allergy seasons?',
        'samuel_white',
        'Pulmonology'
    );

-- Nephrology
SELECT
    NEW_QUESTION(
        'Kidney Function and Your Health',
        'I''m interested in learning more about kidney function and how it impacts overall health. Can you provide information on the role of kidneys in health and wellness?',
        'jennifer_clark',
        'Nephrology'
    ),
    NEW_QUESTION(
        'Chronic Kidney Disease: Stages and Management',
        'My family member has been diagnosed with chronic kidney disease, and I want to understand the different stages and how it can be managed. Can you explain the stages of chronic kidney disease and their management options?',
        'elizabeth_turner',
        'Nephrology'
    ),
    NEW_QUESTION(
        'Hemodialysis vs. Peritoneal Dialysis',
        'I''m looking for information on the key differences between hemodialysis and peritoneal dialysis. Can you provide a comparison of these two types of dialysis and their respective benefits and considerations?',
        'daniel_lee',
        'Nephrology'
    ),
    NEW_QUESTION(
        'Transplantation: Kidney Donor and Recipient Information',
        'I''m interested in kidney transplantation and would like to know more about the process, both from the donor and recipient perspectives. Can you provide information for both kidney donors and recipients, including the transplantation process and considerations?',
        'sophia_hall',
        'Nephrology'
    ),
    NEW_QUESTION(
        'Hydration and Kidney Health',
        'I''ve heard that proper hydration is important for kidney health. Can you provide guidance on how staying hydrated is essential for kidney health and tips on maintaining adequate hydration levels?',
        'oliver_adams',
        'Nephrology'
    );